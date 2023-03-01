

import 'package:flutter/material.dart';

class GenericTextForm extends StatelessWidget {
  const GenericTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Label"),
        ),
        initialValue: "Label",
      ),
    );
  }
}
