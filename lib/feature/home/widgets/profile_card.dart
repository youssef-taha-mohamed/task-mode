import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/svg.dart';
import '../../../shared/widgets/main_text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 19),
      decoration: BoxDecoration(
        color: MyColors.color1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 12,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.chart,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        MyColors.color1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  MainText(
                    'أرباح اليوم',
                    color: MyColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              MainText(
                '1.000.000 د.ع',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              Container(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: MyColors.neutral100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MainText(
                  '25 فاتورة',
                  color: MyColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SvgPicture.asset(SvgAssets.arrow),
        ],
      ),
    );
  }
}
