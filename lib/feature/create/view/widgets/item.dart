import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import '../../../../core/resources/svg.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../../../shared/widgets/text_helper.dart';
import '../../model/product.dart';
import 'custom_icon_button.dart';
import 'custom_image_view.dart';
import 'custom_increament_view.dart';

class InvoiceItemCard extends StatelessWidget {
  final InvoiceItem item;
  final VoidCallback? onQuantityDecrement;
  final VoidCallback? onQuantityIncrement;
  final VoidCallback? onActionTap;
  final VoidCallback? onTap;

  const InvoiceItemCard({
    super.key,
    required this.item,
    this.onQuantityDecrement,
    this.onQuantityIncrement,
    this.onActionTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 8.h,
        children: [_buildItemCard(context), _buildQuantityControls(context)],
      ),
    );
  }

  Widget _buildItemCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.color1,
        borderRadius: BorderRadius.circular(10.h),
        border: item.isSelected
            ? Border.all(color: appTheme.blue_400, width: 2.h)
            : null,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.h,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        spacing: 2.h,
        children: [_buildImageSection(context), _buildItemDetails(context)],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84.h,
      decoration: BoxDecoration(
        color: MyColors.color21,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.h),
          topRight: Radius.circular(6.h),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: CustomImageView(
              imagePath: item.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4.h,
            right: 4.h,
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.fillColor,
                borderRadius: BorderRadius.circular(8.h),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4.h,
                    offset: Offset(0, 4.h),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: CustomIconButton.withShadow(
                iconPath: SvgAssets.menu,
                onPressed: onActionTap,
                width: 16.h,
                height: 16.h,
                padding: EdgeInsets.all(4.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 3.h),
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainText(
            item.title,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: MyColors.white,
          ),
          MainText(
            item.price,
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: MyColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context) {
    if (item.isExpired) {
      return Container(
        margin: EdgeInsets.only(top: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(
          spacing: 4.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: SvgAssets.expires,
              width: 12.h,
              height: 12.h,
            ),
            MainText(
              'منتهية الصلاحية',
              color: MyColors.color33,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onQuantityDecrement,
            child: CustomImageView(
              imagePath: SvgAssets.add,
              width: 24.h,
              height: 24.h,
            ),
          ),
          Text(
            '${item.quantity}',
            style: TextStyleHelper.instance.body12MediumPoppins,
          ),
          CustomIncrementView(
            iconPath: item.isSelected ? SvgAssets.modrase : SvgAssets.modrase,
            width: 24.h,
            height: 24.h,
            onTap: onQuantityIncrement,
          ),
        ],
      ),
    );
  }
}
