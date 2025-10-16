/// Import Dart and Flatter
import 'package:flutter/material.dart';

/// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, this.url, this.name, this.desc, this.onLike});

  final String? url;
  final String? name;
  final String? desc;
  final VoidCallback? onLike;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
        builder: (BuildContext ctx, DefaultTheme theme) {
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 100,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: theme.blackColor100,
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor!,
                  blurRadius: 7.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    7.0, // Move to right 5  horizontally
                    7.0, // Move to bottom 5 Vertically
                  ),
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
                    //height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        url != null ? Image.network(url!) : Image.asset('assets/system/images/no_photo.jpg'),
                        Text(name != null ? name! : 'No Name', style: TextStyle(fontSize: 18, color: theme.mainColor300),textAlign: TextAlign.center,),
                        Text(desc != null ? desc! : '', style:TextStyle(fontSize: 12, color: theme.mainColor500),textAlign: TextAlign.center,),
                      ],
                    ),
                  )
                ),
                Positioned(
                  left: 110.0,
                  top: 0.0,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, size: 50, color: theme.redColor200,),
                    onPressed: () => onLike,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
