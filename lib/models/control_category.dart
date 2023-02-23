

import 'usable_control.dart';

class ControlCategory {
  final String title;
  bool isExpanded = false;
  final List<UsableControl> controls;

  ControlCategory({required this.title, required this.controls});
}

