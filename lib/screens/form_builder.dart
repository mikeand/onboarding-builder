import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/preview_display.dart';
import '../models/controls_displayed.dart';
import '../models/prototype_control_list.dart';
import '../models/trash_list.dart';
import '../components/display_shell.dart';

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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Form Builder"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.edit), text: "Edit",),
              Tab(icon: Icon(Icons.preview), text: "Preview",),
            ]),
          ),
          body: const TabBarView(children: [
            DisplayShell(),
            PreviewDisplay(),
          ],),
        ),
      ),
    );
  }
}
