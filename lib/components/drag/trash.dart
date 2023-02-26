import 'package:flutter/material.dart';
import '../controls/placeable_control.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  Widget _buildDragTarget(BuildContext context,
      List<PlaceableControl?> incoming, List rejected) {
    return const ListTile(
      trailing: Icon(Icons.delete),
      title: Text("Trash"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<PlaceableControl>(
      builder: _buildDragTarget,
      onAccept: (_) {},
    );
  }
}
