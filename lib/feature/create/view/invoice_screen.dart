import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resources/svg.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/main_text.dart';
import '../../../shared/widgets/main_text_form.dart';
import '../../../shared/widgets/share_button.dart';
import 'complete.dart';
import 'widgets/invoice_summary.dart';

class NewInvoiceScreen extends StatelessWidget {
  const NewInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          CustomHeader(
            title: 'فاتورة جديدة',
            image: SvgAssets.arrowRight,
            newInvoice: true,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 34),
                        InvoiceSummary(),
                        const SizedBox(height: 24),
                        MainTextField(
                          titleLabel: 'اسم المورد',
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'رقم الهاتف',
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'الدولة',
                          suffixIcon: SvgPicture.asset(SvgAssets.arrowRight),
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'المحافظة',
                          suffixIcon: SvgPicture.asset(SvgAssets.arrowRight),
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'العنوان',
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            MainText(
                              'خصم قيمة',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            Checkbox(
                              value: true,
                              onChanged: (val) {},
                              activeColor: MyColors.primaryColor,
                              checkColor: MyColors.white,
                              visualDensity: VisualDensity(horizontal: 0),
                            ),
                            const SizedBox(width: 65),
                            MainText(
                              'خصم نسبة',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            Checkbox(
                              value: false,
                              onChanged: (val) {},
                              activeColor: MyColors.primaryColor,
                              checkColor: MyColors.white,
                              visualDensity: VisualDensity(horizontal: 0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'قيمة الخصم',
                          controller: TextEditingController(text: '1.000.000'),
                          showClearButton: false,
                          suffixIcon: MainText(
                            'د.ع',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          spacing: 14,
                          children: [
                            MainText(
                              'أجل',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            Switch(
                              value: false,
                              onChanged: (val) {},
                              inactiveThumbColor: MyColors.white,
                              padding: EdgeInsets.zero,
                              activeTrackColor: MyColors.primaryColor,
                              activeColor: MyColors.primaryColor,
                              inactiveTrackColor: MyColors.neutral100,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'الواصل',
                          controller: TextEditingController(text: '1.000.000'),
                          showClearButton: false,
                          suffixIcon: MainText(
                            'د.ع',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'الباقي',
                          controller: TextEditingController(text: '1.000.000'),
                          showClearButton: false,
                          suffixIcon: MainText(
                            'د.ع',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'الوقت المتوقع للتسديد',
                          suffixIcon: SvgPicture.asset(SvgAssets.calendar),
                          showClearButton: false,
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'أجور أخرى',
                          controller: TextEditingController(text: '1.000.000'),
                          showClearButton: false,
                          suffixIcon: MainText(
                            'د.ع',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainTextField(
                          titleLabel: 'ملاحظات الفاتورة',
                          showClearButton: false,
                        ),
                        const SizedBox(height: 14),
                        SharedButton(
                          backgroundColor: MyColors.primaryColor,
                          height: 50,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 4,
                                children: [
                                  Icon(Icons.arrow_back_ios, size: 20),
                                  MainText(
                                    'دفع',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                              MainText(
                                ' 125.000 د.ع',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          spacing: 23,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           InvoiceManagementScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: MainText(
                                  'حفظ وطباعة',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: MyColors.primaryColor,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: MainText(
                                  'إلغاء',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
