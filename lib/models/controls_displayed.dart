import 'package:flutter/material.dart';

import 'control_display_item.dart';

class ControlsDisplayed with ChangeNotifier {
  final List<ControlDisplayItem> _controls = [];
  ControlDisplayItem? _selected;
  int count = 0;

  List<ControlDisplayItem> get controls => [..._controls];

  ControlDisplayItem? get selected => _selected;

  Widget? get selectedForm =>
      selected?.createForm(selected?.displayWidget?.key);

  int get length => _controls.length;

  void addControl(ControlDisplayItem item) {
    count++;
    final key = ValueKey(count);
    final newControl = item.createWidget(key);
    final newItem = ControlDisplayItem(
        id: count,
        category: item.category,
        name: item.name,
        createWidget: item.createWidget,
        createForm: item.createForm,
        displayWidget: newControl);
    _controls.add(newItem);
    setSelected(newItem);
  }

  void moveControl(ControlDisplayItem control, int position) {
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

  void remove(ControlDisplayItem control) {
    _controls.remove(control);
    notifyListeners();
  }

  void setSelected(ControlDisplayItem control) {
    _selected = control;
    notifyListeners();
  }
}
