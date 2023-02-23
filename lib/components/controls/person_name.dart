import 'package:flutter/material.dart';

class PersonName extends StatelessWidget {
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
