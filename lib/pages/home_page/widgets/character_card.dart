/// Import Dart and Flatter
import 'package:flutter/material.dart';

/// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';
import 'package:model_layer/model_layer.dart';

import 'load_image.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character, this.onLike});

  final Character character;
  final VoidCallback? onLike;

  // Widget LoadImage(String? path) {
  //   (character.image != null )
  //       ? return Image.network(
  //           character.image!,
  //           loadingBuilder: (context, child, loadingProgress) {
  //             if (loadingProgress == null) {
  //               // Картинка полностью загружена
  //               return child;
  //             }
  //             // Пока грузится — показываем индикатор
  //             return Center(
  //               child: CircularProgressIndicator(
  //                 value: loadingProgress.expectedTotalBytes != null
  //                     ? loadingProgress.cumulativeBytesLoaded /
  //                     loadingProgress.expectedTotalBytes!
  //                     : null,
  //               ),
  //             );
  //           },
  //         )
  //       : return Image.asset('assets/system/images/no_photo.jpg'),
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
        builder: (BuildContext ctx, DefaultTheme theme) {
          return Container(
            margin: EdgeInsets.all(10.0),
            //width: 70,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: theme.blackColor100,
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor!,
                  blurRadius: 7.0,
                  spreadRadius: 0.0,
                  offset: Offset(7.0, 7.0),
                )
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    //width: 350,
                    //height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: LoadImage(path: character.image)),

                        Text(character.name ?? 'No Name', style: TextStyle(fontSize: 18, color: theme.mainColor300),textAlign: TextAlign.center,),
                        Text('State: ${character.status}', style:TextStyle(fontSize: 12, color: theme.mainColor500),textAlign: TextAlign.center,),
                        Text('Species: ${character.species}', style:TextStyle(fontSize: 12, color: theme.mainColor500),textAlign: TextAlign.center,),
                        Text('Type: ${character.type == '' ? 'Unknown': character.type}', style:TextStyle(fontSize: 12, color: theme.mainColor500),textAlign: TextAlign.center,),
                        Text('Gender: ${character.gender}', style:TextStyle(fontSize: 12, color: theme.mainColor500),textAlign: TextAlign.center,),
                      ],
                    ),
                  )
                ),
                Positioned(
                  left: 110.0,
                  top: 0.0,
                  child: IconButton(
                    icon: Icon((character.favourite ?? false) ? Icons.star : Icons.star_border, size: 50, color: theme.redColor200,),
                    onPressed: onLike,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
