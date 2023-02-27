

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/control_group.dart';
import '../components/destination_list.dart';
import '../models/controls_displayed.dart';
import '../models/prototype_control_list.dart';
import '../models/trash_list.dart';

class FormBuilder extends StatelessWidget {
  const FormBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrototypeControlList()),
        ChangeNotifierProvider(create: (_) => ControlsDisplayed()),
        ChangeNotifierProvider(create: (_) => TrashList()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Form Builder"),
        ),
        body: Row(
            children: const [
              DestinationList(),
              ControlGroup()
            ]),
      ),
    );
  }
}
