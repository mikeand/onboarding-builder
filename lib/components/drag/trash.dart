import 'package:flutter/material.dart';
import 'package:onboarding/models/control_display_item.dart';
import 'package:onboarding/models/controls_displayed.dart';
import 'package:onboarding/models/trash_list.dart';
import 'package:provider/provider.dart';
import '../controls/placeable_control.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  Widget _buildDragTarget(BuildContext context,
      List<ControlDisplayItem?> incoming,
      List rejected,
      TrashList trashList) {

    return ListTile(
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: trashList.clear,
      ),
      title: Text("Trash"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trashList = context.read<TrashList>();
    final controls = context.read<ControlsDisplayed>();
    return DragTarget<ControlDisplayItem>(
      builder: (ctx, incoming, rejected) =>
          _buildDragTarget(ctx, incoming, rejected, trashList),
      onAccept: (c) {
        trashList.add(c);
        controls.remove(c);
      },
    );
  }
}
