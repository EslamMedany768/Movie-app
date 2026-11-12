import 'package:flutter/cupertino.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_style.dart';

class TabNameWidget extends StatelessWidget {
  GenresEntity item;
  bool isSelected = false;

   TabNameWidget({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: AppColors.orange, width: 2)
            : Border.all(color: AppColors.orange, width: 2),
        color: isSelected ? AppColors.orange : AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Text(
        item.name!,
        style: isSelected
            ? AppStyle.black20SemiBold.copyWith(fontWeight: FontWeight.bold)
            : AppStyle.black20SemiBold.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
      ),
    );
  }
}
