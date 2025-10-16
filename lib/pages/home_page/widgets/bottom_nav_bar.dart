/// Import Dart and Flatter
import 'package:flutter/material.dart';

/// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.index, required this.onTap});

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
        builder: (BuildContext ctx, DefaultTheme theme) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (idx) => onTap(idx),
            unselectedItemColor: theme.mainColor500,
            selectedItemColor: theme.mainColor300,
            selectedLabelStyle: bottomMenuTextStyle,
            unselectedLabelStyle: bottomMenuTextStyle,
            showUnselectedLabels: true,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list, size: 40, color: theme.mainColor500,),
                activeIcon: Icon(Icons.list, size: 40, color: theme.mainColor300,),
                label: 'List of Characters',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_border, size: 40, color: theme.mainColor500,),
                activeIcon: Icon(Icons.star, size: 40, color: theme.mainColor300,),
                label: 'Favorites Characters',
              ),
            ],
          );
        }
    );
  }
}
