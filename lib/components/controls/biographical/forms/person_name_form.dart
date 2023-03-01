import 'package:flutter/material.dart';

class PersonNameForm extends StatelessWidget {
  const PersonNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: ListView(children: [
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                label: Text("Name 1 Label"),
              ),
              initialValue: "Family Name",
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                label: Text("Name 2 Label"),
              ),
              initialValue: "Given Names",
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                label: Text("Name 1 Max Length"),
              ),
              initialValue: "40",
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                label: Text("Name 2 Max Length"),
              ),
              initialValue: "40",
            ),
          ),
        ]),
    );
  }
}
