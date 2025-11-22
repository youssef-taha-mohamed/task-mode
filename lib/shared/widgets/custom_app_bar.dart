import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resources/svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/style/app_colors.dart';
import 'main_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.image,
    this.color = MyColors.background,
    required this.newInvoice,
    this.elementColor,
    this.bottom = 0.0,
  });

  final String title;
  final String image;
  final Color color;
  final bool newInvoice;
  final Color? elementColor;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 40, 24, bottom),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              newInvoice
                  ? GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: MyColors.color1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: MyColors.white,
                          size: 20,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: elementColor ?? MyColors.color1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          SvgAssets.element,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
              MainText.bigText(title, fontSize: 24, color: MyColors.white),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: elementColor ?? MyColors.color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        SvgAssets.notification,
                        width: 24,
                        height: 24,
                      ),
                      Positioned(
                        right: 2,
                        top: -1,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.appRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
