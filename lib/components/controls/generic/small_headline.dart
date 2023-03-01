import 'package:flutter/material.dart';
import './forms/small_headline_form.dart';
import '../placeable_control.dart';

class SmallHeadline extends StatelessWidget implements PlaceableControl {
  @override
  final String controlName = "Generic/Small Headline";

  @override
  PlaceableControl clone({Key? key}) {
    return SmallHeadline(key: key);
  }

  const SmallHeadline({Key? key}) : super(key: key);

  @override
  Widget createForm() {
    return const SmallHeadlineForm();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Small Headline",
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
