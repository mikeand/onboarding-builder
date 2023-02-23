

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DragDestinationPlaceholder extends StatelessWidget {
  const DragDestinationPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DottedBorder(
        dashPattern: const [6, 6],
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        color: Colors.black26,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            height:60,
            color: Colors.white60
          ),
        ),
      ),
    );
  }
}
