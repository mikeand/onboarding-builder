import 'package:flutter/material.dart';
import 'package:onboarding/models/usable_control.dart';

import 'drag/control_drag_feedback.dart';
import 'drag/draggable_item.dart';

class DragContainer extends StatelessWidget {
  final UsableControl control;

  const DragContainer({required this.control, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<UsableControl>(
      data: control,
      feedback: ControlDragFeedback(control.name),
      child: DraggableItem(control),
    );
  }
}
