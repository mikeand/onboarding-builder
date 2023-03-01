

import 'package:flutter/material.dart';

import '../components/controls/placeable_control.dart';

class ControlsDisplayed with ChangeNotifier {
  final List<PlaceableControl> _controls = [];
  PlaceableControl? _selected;
  int count = 0;
  Widget? _selectedForm;

  List<PlaceableControl> get controls => [..._controls];
  PlaceableControl? get selected => _selected;
  Widget? get selectedForm => _selectedForm;

  int get length => _controls.length;

  void addControl(PlaceableControl control) {
    count++;
    final newControl = control.clone(key: ValueKey(count));
    _controls.add(newControl);
    setSelected(newControl);
  }

  void moveControl(PlaceableControl control, int position) {
    final index = _controls.indexOf(control);
    if (index >= 0 && position < length && index != position) {
      _controls.removeAt(index);
      position = position > index ? position - 1 : position;
      _controls.insert(position, control);
      setSelected(control);
      notifyListeners();
    } else if (index == -1) {
      _controls.insert(position, control);
      setSelected(control);
    }
  }

  void remove(PlaceableControl control) {
    _controls.remove(control);
    notifyListeners();
  }

  void setSelected(PlaceableControl control) {
    _selected = control;
    _selectedForm = control.createForm();
    notifyListeners();
  }

}