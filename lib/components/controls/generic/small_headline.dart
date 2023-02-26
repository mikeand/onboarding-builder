import 'package:flutter/material.dart';
import '../placeable_control.dart';

class SmallHeadline extends StatelessWidget implements PlaceableControl {
  @override
  final String controlName = "Generic/Small Headline";

  @override
  PlaceableControl clone() {
    return const SmallHeadline();
  }

  const SmallHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Small Headline",
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
