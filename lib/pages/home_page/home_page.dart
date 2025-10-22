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
  final ScrollController _scrollControllerCharacters = ScrollController();
  final ScrollController _scrollControllerFavourites = ScrollController();

  bool _isLoadingMore = false;
  int _curIndex = 0;
  CharacterList? characters;
  int? _page;
  List<Favourite> favourites = [];

  // Ставим звёздочки в общем списке на элементах из Избранного
  void _setStars() {
    setState(() {
      characters!.results!.forEach((e) {
        favourites.forEach((f) {
          if (e.id == f.id) {
            e.favourite = true;
            //print('fav exist!');
          }
        });
      });
    });
  }

  // Слушаем ответ от isolate _getCharacters
  void _initListener() =>
    receivePort.listen((data) => setState(() {
      if(characters == null) {
        characters = data;                          // Заполнить
        _setStars();
      } else {
        characters!.info = data.info;               // Переписать
        characters!.results!.addAll(data.results);   // Дописать
        _setStars();
      }
      _isLoadingMore = false;
    }));

  // Запускаем изолят загрузка из API элементов
  void _getCharacters(int? page) async {
    await locator.get<CharacterController>().getCharacters(page, receivePort);
  }

  void _listenerScroll() {
    _scrollControllerCharacters.addListener(() {
      if (_scrollControllerCharacters.position.maxScrollExtent == 0) return; // Если нет прокрутки

      final currentScroll = _scrollControllerCharacters.position.pixels;
      final maxScroll = _scrollControllerCharacters.position.maxScrollExtent;

      if ((currentScroll >= (maxScroll - 2500)) && !_isLoadingMore && (_curIndex == 0)) {
        setState(() {
          _isLoadingMore = true;
          if (_page == null) {
            _page = 2;
          } else {
            if (_page! <= characters!.info!.pages!) {
              _page = _page! + 1;
            }
          }

        });
        //print(page);
        if (_page! <= characters!.info!.pages!) {
          _getCharacters(_page);
        }
      }
    });
  }

  void onLike(int? id) {
    setState(() {
      // Меняем состояние поля favorite в общем списке если в этом списке есть этот объект
      // if (characters!.results!.contains(characters!.results!.where((e) => e.id == id).first)) {
      //   characters!.results!.where((e) => e.id == id).first.favourite =
      //   !(characters!.results!.where((e) => e.id == id).first.favourite ?? false);
      // }


      if(_curIndex != 0) {
        // Если это страница Favourites а не общий список, удаляем элемент
        locator.get<CharacterController>().delFavourites(favourites.where((e) => e.id == id).first);
      } else {
        // Если это общий список, то либо добавляем либо удаляем элемент в Favourites
        (characters!.results!.where((e) => e.id == id).first.favourite ?? false)
          ? locator.get<CharacterController>().addFavourites(
            characters!.results!.where((e) => e.id == id).first)
          : locator.get<CharacterController>().delFavourites(
            favourites.where((e) => e.id == id).first);
          //: locator.get<CharacterController>().delFavourites(
          //characters!.results!.where((e) => e.id == id).first);
      }
      _getFavourites();
    });
  }

  void _getFavourites() async {
      favourites = await locator.get<CharacterController>().getFavourites();
  }

  void clearFav() => locator.get<CharacterController>().clearBox();

  @override
  void initState() {
    _initListener();
    // Получение Ибранного д.б. раньше чем получение общего списка
    // т.к. после получения Списка расставляются звёздочки по Избранному
    _getFavourites();
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
    _scrollControllerCharacters.dispose();
    _scrollControllerFavourites.dispose();
    //receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool orientation =
      MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme theme) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => exit(0),
              icon: Icon(Icons.exit_to_app_rounded)),
            // flexibleSpace: LinearProgressIndicator(
            //   value: (_curIndex == 0)
            //     ? (characters == null) ? 0.0
            //       : (_scrollControllerCharacters.position.pixels / (_scrollControllerCharacters.position.maxScrollExtent / characters!.results!.length)) / characters!.info!.count!
            //     : (favourites.length == 0) ? 0.0
            //       : (_scrollControllerFavourites.position.pixels / (_scrollControllerFavourites.position.maxScrollExtent)),
            //
            //   //(characters == null) ? 0
            //   //      : (characters!.results!.length) /
            //   //          ((characters!.info!.count == null) ? 1 : characters!.info!.count!),
            //     //: //((_curIndex == 0)
            //     //    (_scrollController.position.pixels
            //     //     / (_scrollController.position.maxScrollExtent
            //     //         / characters!.results.length))
            //     //     / characters!.info.count!,
            //       // : (_scrollController.position.pixels
            //       //   / (_scrollController.position.maxScrollExtent
            //       //       / characters!.results.where((e) => e.favourite).length))
            //       //   / characters!.results.where((e) => e.favourite).length
            //       //),
            //   backgroundColor: theme.mainColor500,
            //   color: theme.mainColor300,
            //   minHeight: double.infinity,
            // ),
            title: Text(AppLocalizations.of(context)!.home_title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.settings_rounded),
                onPressed: () => MyFluroRouter.router.navigateTo(context, '/settings'),
              ),
            ],
          ),
          body: BlocBuilder<AppBloc, AppState>(
              builder: (_, AppState state) {
                if (_curIndex == 0) {
                  if (characters != null) {
                    return GridView.builder(
                      key: PageStorageKey('GridCharacters'),  // Уникальный ключ

                      controller: _scrollControllerCharacters,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation ? 2 : 4,
                        childAspectRatio: orientation ? 0.55 : 0.70,
                      ),
                      itemCount: characters!.results!.length,
                      itemBuilder: (context, index) {
                        return CharacterCard(
                          character: characters!.results![index],
                          onLike: () {onLike(characters!.results![index].id);}
                        );
                      }
                    );
                  } else { return Center(child: CircularProgressIndicator());}
                } else {
                  if (characters != null) {
                    return GridView.builder(
                      key: PageStorageKey('Favourites'),  // Уникальный ключ
                      controller: _scrollControllerFavourites,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: orientation ? 2 : 4,
                          childAspectRatio: orientation ? 0.55 : 0.70,
                      ),
                      itemCount: favourites.length, 
                      itemBuilder: (context, index) {
                        return CharacterCard(
                          character: Character(
                            id: favourites[index].id,
                            name: favourites[index].name,
                            status: favourites[index].status,
                            species: favourites[index].species,
                            type: favourites[index].type,
                            gender: favourites[index].gender,
                            origin: null,
                            location: null,
                            image: favourites[index].image,
                            episode: favourites[index].episode,
                            url: favourites[index].url,
                            created: favourites[index].created,
                            favourite: true
                          ),
                          onLike: () {
                            onLike(favourites[index].id);
                          }
                        );
                      }
                    );
                  } else { return Center(child: Text('No Favourites'));}
                }
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
