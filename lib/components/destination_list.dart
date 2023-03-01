import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drag/drag_destination_placeholder.dart';
import '../models/controls_displayed.dart';
import './drag/drag_destination_item.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({super.key});

  Widget _buildItem(
      BuildContext context, int index, ControlsDisplayed controlList) {
    if (index == controlList.length) {
      return const DragDestinationPlaceholder();
    } else {
      return DragDestinationItem(
          control: controlList.controls[index],
          position: index);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final controlList = context.watch<ControlsDisplayed>();

    return Container(
        width: width - 430,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(255, 255, 244, 1),
              Color.fromRGBO(255, 255, 252, 1),
            ]),
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(5)),
        child: ListView.builder(
          itemBuilder: (ctx, idx) => _buildItem(ctx, idx, controlList),
          itemCount: controlList.controls.length + 1,
        ));
  }
}
