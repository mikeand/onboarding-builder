// stores ExpansionPanel state information
import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/draggable_item.dart';
import 'package:onboarding/models/prototype_control_list.dart';
import 'package:provider/provider.dart';
import 'drag/trash.dart';

class ControlGroup extends StatefulWidget {
  const ControlGroup({super.key});

  @override
  State<ControlGroup> createState() => _ControlGroupState();
}

class _ControlGroupState extends State<ControlGroup> {
  final List<String> _expanded = [];

  @override
  Widget build(BuildContext context) {
    final controls = context.read<PrototypeControlList>();

    return SingleChildScrollView(
      child: SizedBox(
        width: 400,
        child: _buildPanel(controls),
      ),

    );
  }

  Widget _buildPanel(PrototypeControlList controls) {
    final categories = controls.categoryList;

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          var listIndex = _expanded.indexOf(categories[index]);
          if (listIndex != -1) {
            _expanded.removeAt(listIndex);
          }
          else {
            _expanded.add(categories[index]);
          }
        });
      },
      children: categories.map<ExpansionPanel>((categoryName) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return (categoryName == 'Trash' ? const Trash() : ListTile(
              title: Text(categoryName),
            ) );
          },
          body: Column(
            children: controls.getControlsForCategory(categoryName)
                .map((e) =>
                DraggableItem(
                  control: e,
                ))
                .toList(),
          ),
          isExpanded: _expanded.contains(categoryName),
        );
      }).toList(),
    );
  }
}
