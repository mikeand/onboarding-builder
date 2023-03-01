

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/controls_displayed.dart';
import 'control_group.dart';
import 'destination_list.dart';

class DisplayShell extends StatelessWidget {
  const DisplayShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControlsDisplayed controls = context.watch<ControlsDisplayed>();

    return Row(
      children: [
        const DestinationList(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ControlGroup(),
            controls.selectedForm ?? const Placeholder(),
          ],
        ),
      ],
    );
  }
}
