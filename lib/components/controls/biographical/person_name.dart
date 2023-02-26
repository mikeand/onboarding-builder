import 'package:flutter/material.dart';
import '../placeable_control.dart';

class PersonName extends StatelessWidget implements PlaceableControl {
  @override
  String get controlName => "Biographical/Person Name";

  @override
  PlaceableControl clone() {
    return const PersonName();
  }

  const PersonName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text("Family Name")),
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Given Names")),
        ),
      ],
    );
  }

}
