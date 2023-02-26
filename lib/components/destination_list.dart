import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/drag_destination_placeholder.dart';
import 'package:onboarding/models/usable_control.dart';

import 'drag/drag_destination_item.dart';

class DestinationList extends StatefulWidget {
  const DestinationList({Key? key}) : super(key: key);

  @override
  State<DestinationList> createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  List<UsableControl> controls = [];

  void _handleAddControl(UsableControl control, int listPosition) {
    setState(() {
      controls.insert(listPosition,
          UsableControl.from(control)..placeInList = listPosition);
      controls.remove(control);
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == controls.length) {
      return Column(children: [
        DragDestinationPlaceholder(
          onAdd: _handleAddControl,
          position: index,
        ),
      ]);
    } else {
      return DragDestinationItem(
          control: controls[index], position: index, onAdd: _handleAddControl);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width - 430,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(255, 255, 224, 1),
              Color.fromRGBO(255, 255, 252, 1),
            ]),
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(5)),
        child: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: controls.length + 1,
        ));
  }
}
