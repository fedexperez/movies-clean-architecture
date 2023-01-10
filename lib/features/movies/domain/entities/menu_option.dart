import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption extends Equatable {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  const MenuOption(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});

  @override
  List<Object?> get props => [
        route,
        icon,
        name,
        screen,
      ];
}
