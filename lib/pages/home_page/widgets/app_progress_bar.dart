import 'package:flutter/material.dart';

class AppProgressBar extends StatelessWidget {
  const AppProgressBar({super.key, this.value, this.foreground, this.background});

  final double? value;
  final Color?  foreground;
  final Color?  background;


  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value ?? 0.0,

      //(_curIndex == 0)
      //  ? (characters == null) ? 0.0
      //    : (_scrollControllerCharacters.position.pixels / (_scrollControllerCharacters.position.maxScrollExtent / characters!.results!.length)) / characters!.info!.count!
      //  : (favourites.length == 0) ? 0.0
      //    : (_scrollControllerFavourites.position.pixels / (_scrollControllerFavourites.position.maxScrollExtent)),

      //(characters == null) ? 0
      //      : (characters!.results!.length) /
      //          ((characters!.info!.count == null) ? 1 : characters!.info!.count!),
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
      backgroundColor: background ?? ThemeData().appBarTheme.backgroundColor,
      color: foreground ?? ThemeData().appBarTheme.foregroundColor,
      minHeight: double.infinity,
    );
  }
}
