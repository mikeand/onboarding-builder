import 'package:flutter/material.dart';
import 'package:onboarding/components/controls/placeable_control.dart';

class ControlDisplayItem {
  int id;
  final String category;
  final String name;
  PlaceableControl displayWidget;
  Widget? form;

  ControlDisplayItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.displayWidget,
      this.form});
}
