import 'package:flutter/material.dart';

class SmallHeadlineForm extends StatelessWidget {
  const SmallHeadlineForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text("Headline Text"),
        ),
        initialValue: "Small Headline",
      ),
    );
  }
}
