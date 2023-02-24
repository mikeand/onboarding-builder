
import 'package:flutter/material.dart';

class ControlDragFeedback extends StatelessWidget {
  final String name;

  const ControlDragFeedback(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(children: [
          const Icon(Icons.drag_indicator),
          Container(
            color: Colors.white38,
            width: 300,
            height: 60,
            child: Text(name,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.right),
          ),
        ]),
      ),
    );
  }
}
