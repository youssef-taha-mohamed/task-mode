import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import '../../core/resources/svg.dart';
import '../../shared/widgets/custom_app_bar.dart';
import 'model/item.dart';
import 'widgets/grid_item.dart';
import 'widgets/profile_card.dart';

final List<GridItemModel> gridItems = [
  GridItemModel(
    title: 'المبيعات',
    icon: SvgAssets.icon,
    color: MyColors.color2,
  ),
  GridItemModel(
    title: 'المشتريات',
    icon: SvgAssets.icon2,
    color: MyColors.color3,
  ),
  GridItemModel(
    title: 'المرتجعات',
    icon: SvgAssets.icon3,
    color: MyColors.color4,
  ),
  GridItemModel(
    title: 'السندات',
    icon: SvgAssets.icon4,
    color: MyColors.color5,
  ),
  GridItemModel(
    title: 'المصروفات',
    icon: SvgAssets.icon5,
    color: MyColors.color6,
  ),
  GridItemModel(title: 'الديون', icon: SvgAssets.icon6, color: MyColors.color7),
  GridItemModel(
    title: 'الأقساط',
    icon: SvgAssets.icon14,
    color: MyColors.color8,
  ),
  GridItemModel(
    title: 'الموردين',
    icon: SvgAssets.icon7,
    color: MyColors.color9,
  ),
  GridItemModel(
    title: 'العملاء',
    icon: SvgAssets.icon8,
    color: MyColors.color10,
  ),
  GridItemModel(
    title: 'الصندوق',
    icon: SvgAssets.icon9,
    color: MyColors.color11,
  ),
  GridItemModel(
    title: 'المخزن',
    icon: SvgAssets.icon10,
    color: MyColors.color12,
  ),
  GridItemModel(
    title: 'أونلاين',
    icon: SvgAssets.icon11,
    color: MyColors.color13,
  ),
  GridItemModel(
    title: 'التقارير',
    icon: SvgAssets.icon12,
    color: MyColors.color15,
  ),
  GridItemModel(
    title: 'إرسال التقارير',
    icon: SvgAssets.icon13,
    color: MyColors.color14,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          CustomHeader(
            bottom: 12,
            color: MyColors.color1,
            title: 'logo',
            image: SvgAssets.arrowRight,
            newInvoice: false,
            elementColor: MyColors.background,
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: ProfileCard()),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 24,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = gridItems[index];
                      return GridItem(item: item);
                    }, childCount: gridItems.length),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
