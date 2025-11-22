import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../model/product.dart';

class CategoryIconWidget extends StatelessWidget {
  final CategoryItem category;
  final VoidCallback? onTap;

  const CategoryIconWidget({super.key, required this.category, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 4,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: category.iconColor, width: 1),
            ),
            child: SvgPicture.asset(
              category.iconPath,
              width: 16.w,
              height: 20.h,
              color: category.iconColor,
            ),
          ),
          MainText(
            category.label,
            color: MyColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
