

// stores ExpansionPanel state information
import 'package:flutter/material.dart';
import 'package:onboarding/components/controls/generic_text.dart';
import 'package:onboarding/components/controls/person_name.dart';
import 'package:onboarding/components/drag_container.dart';
import 'package:onboarding/models/usable_control.dart';

import '../models/control_category.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<ControlCategory> _categories = [
    ControlCategory(title: "Generic", controls: [
      UsableControl(name: 'Text Input', displayWidget: const GenericText()),
      UsableControl(name: 'Number Input', displayWidget: const GenericText()),
    ]),
    ControlCategory(title: "Biographical", controls: [
      UsableControl(name: 'Name Input', displayWidget: const PersonName()),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 400,
            child: _buildPanel(),
        ),
        const SizedBox()
      ],
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _categories[index].isExpanded = !isExpanded;
        });
      },
      children: _categories.map<ExpansionPanel>((ControlCategory item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.title),
            );
          },
          body: Column(children: item.controls.map((e) =>
              DragContainer(control: e,)).toList(),),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
