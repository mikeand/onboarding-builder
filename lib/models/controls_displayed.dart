

import 'package:flutter/foundation.dart';

import '../components/controls/placeable_control.dart';

class ControlsDisplayed with ChangeNotifier {
  final List<PlaceableControl> _controls = [];

  List<PlaceableControl> get controls => [..._controls];

  int get length => _controls.length;

  void addControl(PlaceableControl control) {
    _controls.add(control.clone());
    notifyListeners();
  }

  void moveControl(PlaceableControl control, int position) {
    final index = _controls.indexOf(control);
    if (index >= 0 && position < length && index != position) {
      _controls.removeAt(index);
      position = position > index ? position - 1 : position;
      _controls.insert(position, control);
      notifyListeners();
    } else if (index == -1) {
      _controls.insert(position, control);
      notifyListeners();
    }
  }

}