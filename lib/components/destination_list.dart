import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/drag_destination_placeholder.dart';
import 'package:onboarding/models/usable_control.dart';

import 'drag_container.dart';

class DestinationList extends StatefulWidget {
  const DestinationList({Key? key}) : super(key: key);

  @override
  State<DestinationList> createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  List<UsableControl> controls = [];

  Widget itemBuilder(
      BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
    var results = List<Widget>.empty(growable: true);
    results.addAll(controls.map((e) => DragContainer(control: e)));
    results.add(const DragDestinationPlaceholder());
    return ListView(children: results);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 430,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(5)),
      child: DragTarget<UsableControl>(
        builder: itemBuilder,
        onWillAccept: (control) => true,
        onAccept: (UsableControl control) {
          setState(() {
            controls.add(control);
          });
        },
      ),
    );
  }
}
