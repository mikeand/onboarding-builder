import 'package:flutter/material.dart';

class ControlDisplayItem {
  int id;
  final String category;
  final String name;
  Widget Function(Key?) createWidget;
  Widget Function(Key?) createForm;
  Widget displayWidget = const Placeholder();

  ControlDisplayItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.createWidget,
      required this.createForm,
      required this.displayWidget});
}
