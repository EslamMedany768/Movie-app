import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';

class CustomTextField extends StatefulWidget {
  IconData? prefixIcon;
  String text;
  bool isSuffix;
  bool isObscure;

  CustomTextField({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.isSuffix = false,
    this.isObscure=false
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure,
      cursorColor: AppColors.white,
      style: AppStyle.white16Regular.copyWith(decorationThickness: 0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        fillColor: AppColors.grey,
        filled: true,
        hintText: widget.text,
        hintStyle: AppStyle.white16Regular,
        prefixIcon: Icon(widget.prefixIcon, color: AppColors.white),
        suffixIcon: widget.isSuffix
            ? IconButton(
                onPressed: () {
                  widget. isObscure = !widget.isObscure;
                  setState(() {

                  });
                },
                icon: widget.isObscure
                    ? ImageIcon(
                        AssetImage("assets/images/icon _eye off_.png"),
                        color: AppColors.white,
                      )
                    : Icon(Icons.remove_red_eye, color: AppColors.white),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
