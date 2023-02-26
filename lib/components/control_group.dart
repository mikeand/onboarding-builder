// stores ExpansionPanel state information
import 'package:flutter/material.dart';
import 'package:onboarding/components/controls/generic/small_headline.dart';
import 'package:onboarding/components/controls/generic_text.dart';
import 'package:onboarding/components/controls/person_name.dart';
import 'package:onboarding/components/drag/draggable_item.dart';
import 'package:onboarding/models/usable_control.dart';

import '../models/control_category.dart';

class ControlGroup extends StatefulWidget {
  const ControlGroup({super.key});

  @override
  State<ControlGroup> createState() => _ControlGroupState();
}

class _ControlGroupState extends State<ControlGroup> {
  final List<ControlCategory> _categories = [
    ControlCategory(title: "Generic", controls: [
      UsableControl(name: 'Text Input', displayWidget: const GenericText()),
      UsableControl(name: 'Number Input', displayWidget: const GenericText()),
      UsableControl(name: 'Small Headline', displayWidget: const SmallHeadline()),
    ]),
    ControlCategory(
      title: "Biographical",
      controls: [
        UsableControl(name: 'Name Input', displayWidget: const PersonName()),
      ],
    ),
    ControlCategory(title: "Trash", controls: []),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
            width: 400,
            child: _buildPanel(),
          ),

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
          body: Column(
            children: item.controls
                .map((e) => DraggableItem(
                      control: e,
                    ))
                .toList(),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
