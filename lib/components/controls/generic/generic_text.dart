import 'package:flutter/material.dart';
import '../placeable_control.dart';

class GenericText extends StatelessWidget implements PlaceableControl {
  @override
  final String controlName = "Generic/Text Input";

  @override
  PlaceableControl clone() {
    return const GenericText();
  }

  const GenericText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text("Label")
      ),
    );
  }
}
