import 'package:flutter/foundation.dart';
import 'package:onboarding/models/control_display_item.dart';
import '../components/controls/biographical/person_name.dart';
import '../components/controls/generic/forms/generic_text_form.dart';
import '../components/controls/generic/small_headline.dart';
import '../components/controls/generic/generic_text.dart';
import '../components/controls/placeable_control.dart';

class PrototypeControlList with ChangeNotifier {
  final List<ControlDisplayItem> _controls = [
    ControlDisplayItem(
        id: -1,
        category: "Generic",
        name: "Text Input",
        displayWidget: const GenericText()),
    ControlDisplayItem(
        id: -2,
        category: "Generic",
        name: "Small Headline",
        displayWidget: const SmallHeadline()),
    ControlDisplayItem(
        id: -1,
        category: "Biographical",
        name: "Name Input",
        displayWidget: const PersonName()),

  ];

  int get length => _controls.length;

  List<String> get categoryList =>
    _controls.map((c) => c.category).toSet().toList()..add("Trash");

  List<ControlDisplayItem> getControlsForCategory(String category) =>
      _controls.where((c) => c.category == category).toList();
}
