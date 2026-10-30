import 'package:flutter/material.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(text: "Search", prefixIcon: Icons.search),
              Expanded(child: Image.asset("assets/images/empty_icon.png"))
            ],
          ),
        ),
      ),
    );
  }
}
