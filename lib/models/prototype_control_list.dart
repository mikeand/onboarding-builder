import 'package:flutter/foundation.dart';
import 'package:onboarding/components/controls/biographical/forms/person_name_form.dart';
import 'package:onboarding/models/control_display_item.dart';
import '../components/controls/biographical/person_name.dart';
import '../components/controls/generic/forms/generic_text_form.dart';
import '../components/controls/generic/forms/small_headline_form.dart';
import '../components/controls/generic/small_headline.dart';
import '../components/controls/generic/generic_text.dart';
import '../components/controls/medical/image_capture.dart';

class PrototypeControlList with ChangeNotifier {
  final List<ControlDisplayItem> _controls = [
    ControlDisplayItem(
      id: -1,
      category: "Generic",
      name: "Text Input",
      createWidget: (key) => GenericText(key: key),
      createForm: (key) => GenericTextForm(key: key),
      displayWidget: const GenericText(key: ValueKey<int>(-1)),
    ),
    ControlDisplayItem(
      id: -2,
      category: "Generic",
      name: "Small Headline",
      createWidget: (key) => SmallHeadline(key: key),
      createForm: (key) => SmallHeadlineForm(key: key),
      displayWidget: const SmallHeadline(key: ValueKey<int>(-2)),
    ),
    ControlDisplayItem(
      id: -3,
      category: "Biographical",
      name: "Name Input",
      createWidget: (key) => PersonName(key: key),
      createForm: (key) => PersonNameForm(key: key),
      displayWidget: const PersonName(key: ValueKey<int>(-3)),
    ),
    ControlDisplayItem(
      id: -4,
      category: "Medical",
      name: "Take Picture",
      createWidget: (key) => ImageCapture(key: key),
      createForm: (key) => GenericTextForm(key: key),
      displayWidget: const ImageCapture(key: ValueKey<int>(-4)),
    ),
  ];

  int get length => _controls.length;

  List<String> get categoryList =>
      _controls.map((c) => c.category).toSet().toList()..add("Trash");

  List<ControlDisplayItem> getControlsForCategory(String category) =>
      _controls.where((c) => c.category == category).toList();
}
