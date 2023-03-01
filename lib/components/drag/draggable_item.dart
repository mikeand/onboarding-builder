import 'package:flutter/material.dart';
import 'package:onboarding/models/controls_displayed.dart';
import 'package:provider/provider.dart';
import '../controls/placeable_control.dart';
import 'control_drag_feedback.dart';

class DraggableItem extends StatelessWidget {
  final PlaceableControl control;

  const DraggableItem({required this.control, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlName = control.controlName.split("/")[1];
    final controlsDisplayed = context.watch<ControlsDisplayed>();
    final isInList = control.key is ValueKey<int>;
    final selected = (controlsDisplayed.selected == control);

    return GestureDetector(
      onTap: () {
        if (isInList) {
          controlsDisplayed.setSelected(control);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Theme
                .of(context)
                .primaryColor : Colors.black38,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Theme
              .of(context)
              .canvasColor,
        ),
        child: Row(
          children: [
            Draggable<PlaceableControl>(
                data: control,
                feedback: ControlDragFeedback(controlName),
                child: const Icon(Icons.drag_indicator)),
            Expanded(
              child: Stack(children: [
                control,
                SizedBox(
                  width: double.infinity,
                  child: (!isInList
                      ? Text(
                    controlName,
                    textAlign: TextAlign.right,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme
                        .of(context)
                        .primaryColor),
                  )
                      : null),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
