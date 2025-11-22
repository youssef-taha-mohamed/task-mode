import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/style/app_colors.dart';
import '../../../shared/widgets/main_text.dart';
import '../model/item.dart';

class GridItem extends StatelessWidget {
  final GridItemModel item;

  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: MyColors.color1,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: const Offset(0, 0),
            blurRadius: 25,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(item.icon, height: 40, width: 40,),
          ),
          MainText(
            item.title,
            color: MyColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
