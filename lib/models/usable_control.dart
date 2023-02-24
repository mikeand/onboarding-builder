
import 'package:flutter/material.dart';

class UsableControl {
  final String name;
  final Widget displayWidget;
  int? placeInList;

  UsableControl({ required this.name, required this.displayWidget});

  static UsableControl from(UsableControl control) {
    return UsableControl(
        name: control.name,
        displayWidget: control.displayWidget,
    );
  }
}