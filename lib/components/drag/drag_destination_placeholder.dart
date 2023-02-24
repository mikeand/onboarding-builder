import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:onboarding/models/usable_control.dart';

class DragDestinationPlaceholder extends StatelessWidget {
  final Function(UsableControl, int) onAdd;
  final double height;
  final int position;

  const DragDestinationPlaceholder(
      {required this.onAdd, this.height = 60, this.position = -1, Key? key})
      : super(key: key);

  Widget _buildDragTarget(
      BuildContext context, List<UsableControl?> incoming, List rejected) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DottedBorder(
        dashPattern: const [6, 6],
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        color: Colors.black38,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(height: height, color: Colors.white60),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<UsableControl>(
      builder: _buildDragTarget,
      onAccept: (c) => onAdd(c, position),
    );
  }
}
