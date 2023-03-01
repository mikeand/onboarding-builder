import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:onboarding/components/controls/placeable_control.dart';
import 'package:onboarding/models/control_display_item.dart';
import 'package:provider/provider.dart';

import '../../models/controls_displayed.dart';

class DragDestinationPlaceholder extends StatelessWidget {
  const DragDestinationPlaceholder({super.key});

  Widget _buildDragTarget(
      BuildContext context, List<ControlDisplayItem?> incoming, List rejected) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DottedBorder(
        dashPattern: const [6, 6],
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        color: Colors.black38,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: Container(
            height: 60,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controlList = context.read<ControlsDisplayed>();
    return DragTarget<ControlDisplayItem>(
      builder: _buildDragTarget,
      onAccept: (c) => controlList.addControl(c),
    );
  }
}
