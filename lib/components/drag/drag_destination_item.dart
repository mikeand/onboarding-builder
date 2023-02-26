import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/draggable_item.dart';
import 'package:onboarding/models/usable_control.dart';

/// This is a drag target which encapsulates a [UsableControl]
/// This is so other controls can be dragged over the top of this
/// item and the dragged item will be inserted above this item.
class DragDestinationItem extends StatelessWidget {
  final UsableControl control;
  final int position;
  final Function(UsableControl, int) onAdd;

  const DragDestinationItem(
      {Key? key,
      required this.control,
      required this.position,
      required this.onAdd})
      : super(key: key);

  Widget _buildDragTarget(
      BuildContext context, List<UsableControl?> incoming, List rejected) {
    return DraggableItem(control: control);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<UsableControl>(
      builder: _buildDragTarget,
      onAccept: (c) => onAdd(c, position),
    );
  }
}
