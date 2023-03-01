import 'package:flutter/material.dart';
import './forms/small_headline_form.dart';

class SmallHeadline extends StatelessWidget {

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
