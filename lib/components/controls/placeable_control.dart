

import 'package:flutter/material.dart';

abstract class PlaceableControl extends StatelessWidget {
  final String controlName = "";

  const PlaceableControl({super.key});
  PlaceableControl clone({Key? key});
  Widget createForm();
}