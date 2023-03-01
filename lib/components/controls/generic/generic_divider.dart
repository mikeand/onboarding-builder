

import 'package:flutter/material.dart';

class GenericDivider extends StatelessWidget {
  const GenericDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Divider(),
    );
  }
}
