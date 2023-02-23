import 'package:flutter/material.dart';

import '../../models/usable_control.dart';

class DraggableItem extends StatelessWidget {
  final UsableControl control;

  const DraggableItem(this.control, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(Icons.drag_indicator),
          Expanded(
            child: Stack(children: [
              control.displayWidget,
              SizedBox(
                width: double.infinity,
                child: Text(
                  control.name,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
