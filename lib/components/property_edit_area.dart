

import 'package:flutter/material.dart';

class PropertyEditArea extends StatelessWidget {
  final Widget? displayForm;

  const PropertyEditArea(this.displayForm, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
        decoration: BoxDecoration(border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(4),
        child: displayForm,
      ),
    );
  }
}
