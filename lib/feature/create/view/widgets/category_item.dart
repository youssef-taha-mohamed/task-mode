import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/text_helper.dart';
import '../../model/product.dart';
import 'custom_image_view.dart';

class CategoryIconWidget extends StatelessWidget {
  final CategoryItem category;
  final VoidCallback? onTap;

  const CategoryIconWidget({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: appTheme.transparentCustom,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appTheme.blue_400, width: 1.h)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: category.iconPath,
              width: 20.h,
              height: 20.h,
              color:  appTheme.whiteCustom,
            ),
            SizedBox(height: 4.h),
            Text(
              category.label,
              style: TextStyleHelper.instance.label8RegularCairo.copyWith(
                  color:  appTheme.whiteCustom),
            ),
          ],
        ),
      ),
    );
  }
}
