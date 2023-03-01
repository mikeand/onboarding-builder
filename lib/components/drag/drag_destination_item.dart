import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/draggable_item.dart';
import 'package:onboarding/components/controls/placeable_control.dart';
import 'package:onboarding/models/control_display_item.dart';
import 'package:onboarding/models/controls_displayed.dart';
import 'package:provider/provider.dart';

/// This is a drag target which encapsulates a [PlaceableControl]
/// This is so other controls can be dragged over the top of this
/// item and the dragged item will be inserted above this item.
class DragDestinationItem extends StatelessWidget {
  final ControlDisplayItem control;
  final int position;

  const DragDestinationItem({
    Key? key,
    required this.control,
    required this.position,
  }) : super(key: key);

  Widget _buildDragTarget(
      BuildContext context, List<ControlDisplayItem?> incoming, List rejected) {
    return DraggableItem(control: control);
  }

  @override
  Widget build(BuildContext context) {
    final controlList = context.read<ControlsDisplayed>();

    return DragTarget<ControlDisplayItem>(
      builder: _buildDragTarget,
      onAccept: (c) => controlList.moveControl(c, position),
    );
  }
}
