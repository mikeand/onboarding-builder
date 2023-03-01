// stores ExpansionPanel state information
import 'package:flutter/material.dart';
import 'package:onboarding/components/drag/draggable_item.dart';
import 'package:onboarding/models/prototype_control_list.dart';
import 'package:onboarding/models/trash_list.dart';
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
    final trash = context.watch<TrashList>();

    return Container(
        width: 400,
      decoration: BoxDecoration(border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(4),
      child: _buildPanel(controls, trash),
    );
  }

  List<Widget> _buildControlsForCategory(
      PrototypeControlList controls, String category) {
    return controls
        .getControlsForCategory(category)
        .map((e) => DraggableItem(
              control: e,
            ))
        .toList();
  }

  List<Widget> _buildControlsForTrash(TrashList trash) =>
      trash.items.map((e) => DraggableItem(control: e)).toList();

  Widget _buildPanel(PrototypeControlList controls, TrashList trash) {
    final categories = controls.categoryList;

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          var listIndex = _expanded.indexOf(categories[index]);
          if (listIndex != -1) {
            _expanded.removeAt(listIndex);
          } else {
            _expanded.add(categories[index]);
          }
        });
      },
      children: categories.map<ExpansionPanel>((categoryName) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return (categoryName == 'Trash'
                ? const Trash()
                : ListTile(
                    title: Text(categoryName),
                  ));
          },
          body: Column(
            children: (categoryName == 'Trash'
                ? _buildControlsForTrash(trash)
                : _buildControlsForCategory(controls, categoryName)),
          ),
          isExpanded: _expanded.contains(categoryName),
        );
      }).toList(),
    );
  }
}
