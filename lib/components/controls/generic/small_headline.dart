import 'package:flutter/material.dart';

class SmallHeadline extends StatelessWidget {
  const SmallHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Small Headline",
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
