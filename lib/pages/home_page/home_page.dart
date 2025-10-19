/// Import Dart and Flatter
import 'package:design_layer/design_layer.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';

/// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// Import Localizations
import '../../l10n/app_localizations.dart';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:model_layer/model_layer.dart';

/// Import Widgets
import 'widgets/bottom_nav_bar.dart';

/// Import Navigation
import '../../fluro_router.dart';
import 'widgets/character_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final receivePort = ReceivePort();
  final ScrollController _scrollController = ScrollController();

  //double _scrollPosition = 0;
  bool _isLoadingMore = false;
  int _curIndex = 0;
  CharacterList? characters;
  //List<Character>? characters;
  int? _page;

  void _initListener() =>
    receivePort.listen((data) => setState(() {
      if(characters == null) {
        characters = data;                          // Заполнить
      } else {
        characters!.info = data.info;               // Переписать
        characters!.results.addAll(data.results);   // Дописать
      }
      _isLoadingMore = false;
    }));

  void _getCharacters(int? page) async {
    await locator.get<CharacterController>().getCharacters(page, receivePort);
  }

  void _listenerScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == 0) return; // Если нет прокрутки

      final currentScroll = _scrollController.position.pixels;
      final maxScroll = _scrollController.position.maxScrollExtent;

      //setState(() => _scrollPosition = _scrollController.offset);

      // Проверяем, достигли ли 95% прокрутки
      //if ((currentScroll >= (0.95 * maxScroll)) && !_isLoadingMore) {
      if ((currentScroll >= (maxScroll - 2500)) && !_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
          if (_page == null) {
            _page = 2;
          } else {
            if (_page! <= characters!.info.pages!) {
              _page = _page! + 1;
            }
          }

        });
        //print(page);
        if (_page! <= characters!.info.pages!) {
          _getCharacters(_page);
        }
      }
    });
  }

  void onLike(int index) {
    setState(() {
      characters!.results[index].favourite = !characters!.results[index].favourite;
    });
  }

  @override
  void initState() {
    _initListener();
    _getCharacters(_page);
    _listenerScroll();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ThemeBloc>().add(ChangeEvent());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool orientation = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;
    //_scrollController. .position..pixel = _scrollPosition;

    return BlocBuilder<ThemeBloc, DefaultTheme>(
        builder: (BuildContext ctx, DefaultTheme theme) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () => exit(0),
                  icon: Icon(Icons.exit_to_app_rounded)),
              flexibleSpace: LinearProgressIndicator(
                value: (characters == null) ? 0
                    : (characters!.results.length) /
                        ((characters!.info.count == null) ? 1 : characters!.info
                          .count!),
                //: //((_curIndex == 0)
                //    (_scrollController.position.pixels
                //     / (_scrollController.position.maxScrollExtent
                //         / characters!.results.length))
                //     / characters!.info.count!,
                  // : (_scrollController.position.pixels
                  //   / (_scrollController.position.maxScrollExtent
                  //       / characters!.results.where((e) => e.favourite).length))
                  //   / characters!.results.where((e) => e.favourite).length
                  //),
                backgroundColor: theme.mainColor500,
                color: theme.mainColor300,
                minHeight: double.infinity,
              ),
              //backgroundColor: Colors.red,
              //title:
              title: Text(AppLocalizations.of(context)!.home_title),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.run_circle_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings_rounded),
                  onPressed: () =>
                      MyFluroRouter.router.navigateTo(context, '/settings'),
                ),
              ],
            ),
            body: BlocBuilder<AppBloc, AppState>(
              builder: (_, AppState state) {
                return (characters != null)
                  ? GridView.builder(
                      //key: PageStorageKey('myGridViewKey'),  // Уникальный ключ
                      //key: GlobalKey(),
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation ? 2 : 4,
                        childAspectRatio: orientation ? 0.60 : 0.70,
                      ),
                      itemCount: (_curIndex == 0)
                        ? characters!.results.length
                        : characters!.results.where((e) => e.favourite == true).length,
                      itemBuilder: (context, index) {
                        if (_curIndex == 0) {
                          return CharacterCard(character: characters!.results[index],
                            onLike: () {onLike(index);});
                        }
                        return CharacterCard(
                            character: characters!.results.where((e) => e.favourite).toList()[index],
                            onLike: () => onLike(index)
                        );
                      }
                    //itemBuilder: (context, index) => CharacterCard(character: characters![index]),
                    )
                  : Center(child: CircularProgressIndicator());
              },
            ),

            bottomNavigationBar: BottomNavBar(
              index: _curIndex,
              onTap: (idx) => setState(() => _curIndex = idx),
            ),
          );
        }
    );
  }
}
