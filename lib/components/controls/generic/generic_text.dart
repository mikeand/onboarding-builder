import 'package:flutter/material.dart';
import 'forms/generic_text_form.dart';

class GenericText extends StatelessWidget {

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
