import 'package:flutter/material.dart';

import '../../utils/app_style.dart';

class CustomTextButton extends StatelessWidget {
  TextStyle style ;
  String text;
  void Function()? function;

  CustomTextButton(
      {super.key, required this.text, required this.function, required this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      onPressed: function,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
