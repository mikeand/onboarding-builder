
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/controls_displayed.dart';

class PreviewDisplay extends StatelessWidget {
  const PreviewDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlList = context.watch<ControlsDisplayed>();

    return ListView(
        padding: const EdgeInsets.all(6),
        children: controlList.controls.map((e) => e.displayWidget).toList(),
    );
  }
}
