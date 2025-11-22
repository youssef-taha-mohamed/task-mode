import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/shared/widgets/main_text_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/svg.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../model/product.dart';
import './widgets/invoice_item_card.dart';
import 'widgets/custom_icon_button.dart';
import 'widgets/item.dart';

class InvoiceManagementScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  InvoiceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          CustomHeader(
            bottom: 12,
            color: MyColors.background,
            title: 'فاتورة جديدة',
            image: SvgAssets.arrowRight,
            newInvoice: false,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 23.h),
                        Row(
                          spacing: 16.h,
                          children: [
                            Expanded(
                              child: MainTextField(
                                hint: 'ابحث باسم المنتج أو الباركود',
                                controller: searchController,
                                onChanged: (value) {},
                                prefixIcon: SvgPicture.asset(SvgAssets.search),
                              ),
                            ),
                            CustomIconButton.withBorder(
                              iconPath: SvgAssets.scan,
                              onPressed: () {},
                              borderColor: MyColors.primaryColor.withOpacity(
                                0.25,
                              ),
                              width: 48.h,
                              height: 50.h,
                              padding: EdgeInsets.all(12.h),
                            ),
                          ],
                        ),
                        SizedBox(height: 23.h),
                        _buildCategoryTabs(context),
                        SizedBox(height: 16.h),
                        _buildInvoiceContent(context),
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

  Widget _buildCategoryTabs(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories
          .map(
            (category) => CategoryIconWidget(category: category, onTap: () {}),
          )
          .toList(),
    );
  }

  Widget _buildInvoiceContent(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            _buildInvoiceGrid(context),
            SizedBox(height: 45.h),
            _buildTotalSummary(context),
            SizedBox(height: 12.h),
            _buildActionButtons(context),
            SizedBox(height: 28.h),
          ],
        ),
      ],
    );
  }

  Widget _buildInvoiceGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 24,
        childAspectRatio: 0.65,
      ),
      itemCount: invoiceItems.length,
      itemBuilder: (context, index) {
        return InvoiceItemCard(
          item: invoiceItems[index],
          onQuantityDecrement: () {},
          onQuantityIncrement: () {},
          onActionTap: () {},
          onTap: () {},
        );
      },
    );
  }

  Widget _buildTotalSummary(BuildContext context) {
    return CustomButton(
      text: '5 عناصر = 125.000 د.ع',
      onPressed: () {},
      width: double.infinity,
      backgroundColor: appTheme.gray_900,
      borderColor: appTheme.colorFF3F3B,
      textColor: appTheme.whiteCustom,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      spacing: 23.h,
      children: [
        Expanded(
          child: CustomButton(
            text: 'التالي',
            onPressed: () {},
            width: double.infinity,
            backgroundColor: appTheme.blue_400,
            textColor: appTheme.whiteCustom,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'إلغاء',
            onPressed: () {},
            width: double.infinity,
            borderColor: appTheme.blue_400,
            textColor: appTheme.blue_400,
          ),
        ),
      ],
    );
  }
}
