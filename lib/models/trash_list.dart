

import 'package:flutter/foundation.dart';

import '../components/controls/placeable_control.dart';

class TrashList with ChangeNotifier {

  final List<PlaceableControl> _controls = [];

  List<PlaceableControl> get items => [..._controls];

  void add(PlaceableControl control) {
    _controls.add(control);
    notifyListeners();
  }

  void clear() {
    _controls.clear();
    notifyListeners();
  }

}