import 'package:flutter/material.dart';
import '../placeable_control.dart';
import 'forms/small_headline_form.dart';

class GenericText extends StatelessWidget implements PlaceableControl {
  @override
  final String controlName = "Generic/Text Input";

  @override
  PlaceableControl clone({Key? key})  {
    return GenericText(key: key,);
  }

  @override
  Widget createForm() {
    return const SmallHeadlineForm();
  }

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
