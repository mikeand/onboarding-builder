
import 'package:flutter/material.dart';

import 'control_group.dart';

class AvailableControls extends StatelessWidget {
  const AvailableControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 350,
        child: ControlGroup());
  }
}
