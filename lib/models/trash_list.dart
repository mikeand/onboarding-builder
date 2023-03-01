

import 'package:flutter/foundation.dart';
import 'package:onboarding/models/control_display_item.dart';

import '../components/controls/placeable_control.dart';

class TrashList with ChangeNotifier {

  final List<ControlDisplayItem> _controls = [];

  List<ControlDisplayItem> get items => [..._controls];

  void add(ControlDisplayItem control) {
    _controls.add(control);
    notifyListeners();
  }

  void clear() {
    _controls.clear();
    notifyListeners();
  }

}