import 'package:clean_architecture_movies/features/movies/domain/entities/menu_option.dart';
import 'package:flutter/material.dart' show IconData, Widget;

class MenuOptionModel extends MenuOption {
  const MenuOptionModel(
      {required String route,
      required IconData icon,
      required String name,
      required Widget screen})
      : super(
          route: route,
          icon: icon,
          name: name,
          screen: screen,
        );
}
