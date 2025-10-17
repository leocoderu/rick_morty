/// Import Dart and Flatter
import 'dart:io';
import 'package:flutter/material.dart';

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

  int curIndex = 0;
  List<Character> _characters = CharacterController().getCharactersF();

  @override
  void didChangeDependencies() {
    context.read<ThemeBloc>().add(ChangeEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => exit(0), icon: Icon(Icons.exit_to_app_rounded)),
        //backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.home_title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_rounded),
            onPressed: () =>  MyFluroRouter.router.navigateTo(context, '/settings'),
          ),
        ],
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (_, AppState state) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation ? 2 : 4,
              childAspectRatio: 0.53,
            ),
            itemCount: _characters.length,
            itemBuilder: (context, index) => CharacterCard(character: _characters[index]),
          );
        },
      ),

      bottomNavigationBar: BottomNavBar(
        index: curIndex,
        onTap: (idx) => setState(() => curIndex = idx),
      ),
    );
  }
}
