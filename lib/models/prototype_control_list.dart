import 'package:flutter/foundation.dart';
import '../components/controls/biographical/person_name.dart';
import '../components/controls/generic/small_headline.dart';
import '../components/controls/generic/generic_text.dart';
import '../components/controls/placeable_control.dart';

class PrototypeControlList with ChangeNotifier {
  final List<PlaceableControl> _controls = [
    const GenericText(key: ValueKey<String>("GenericText")),
    const SmallHeadline(key: ValueKey<String>("SmallHeadline")),
    const PersonName(key: ValueKey<String>("PersonName")),
  ];

  int get length => _controls.length;

  List<String> get categoryList =>
    _controls.map((c) => c.controlName.split("/")[0]).toSet().toList()..add("Trash");

  List<PlaceableControl> getControlsForCategory(String category) =>
      _controls.where((c) => c.controlName.startsWith('$category/')).toList();
}
