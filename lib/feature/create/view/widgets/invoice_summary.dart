import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import '../../../../shared/widgets/main_text.dart';

class InvoiceSummary extends StatelessWidget {
  InvoiceSummary({super.key});

  final Map<String, String> summaryData = {
    'المبلغ:': '500.000 د.ع',
    'الخصومات:': '0 د.ع',
    'أجور أخرى:': '0 د.ع',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: summaryData.entries.map((entry) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainText(
                    entry.key,
                    fontSize: 16,
                    color: MyColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  MainText(
                    entry.value,
                    fontSize: 18,
                    color: MyColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          DottedLine(),
          SizedBox(height: 11,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(
                'المبلغ النهائي:',
                fontSize: 16,
                color: MyColors.white,
                fontWeight: FontWeight.w700,
              ),
              MainText(
                '500.000 د.ع',
                fontSize: 18,
                color: MyColors.white,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class DottedLine extends StatelessWidget {
  final Color color;
  final double height; // ارتفاع (سمك) النقطة
  final double dashWidth; // عرض النقطة
  final double dashSpace; // المسافة بين النقاط

  const DottedLine({
    super.key,
    this.color = Colors.white,
    this.height = 1.0,
    this.dashWidth = 4.0,
    this.dashSpace = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder يسمح لنا بالحصول على العرض المتاح (العرض الأفقي)
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double lineLength = constraints.constrainWidth();

        // حساب عدد النقاط اللازمة لتغطية العرض المتاح
        // يتم تقسيم الطول الكلي على (عرض النقطة + المسافة)
        final int dashCount = (lineLength / (dashWidth + dashSpace)).floor();

        // استخدام Row لعرض النقاط جنباً إلى جنب
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.rectangle,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}