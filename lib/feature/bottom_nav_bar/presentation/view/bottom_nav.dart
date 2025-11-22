import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/svg.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../../create/view/invoice_screen.dart';
import '../../provider/provider.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  static const String routeName = '/bottomNavigator';

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator>
    with TickerProviderStateMixin {
  bool canPop = false;
  Timer? _resetCanPopTimer;

  Widget _buildMainScaffold() {
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        final List<Map<String, dynamic>> navItems = [
          {'icon': SvgAssets.home, 'label': 'الرئيسية'},
          {'icon': SvgAssets.profile, 'label': 'حسابي'},
        ];

        return Scaffold(
          backgroundColor: MyColors.background,
          key: provider.scaffoldKey,
          body: provider.widgetInBody,
          floatingActionButton: provider.showBottomNav
              ? FloatingActionButton(
                  backgroundColor: MyColors.primaryColor,
                  shape: const CircleBorder(),
                  child: SvgPicture.asset(SvgAssets.document,width: 31,height: 31,),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NewInvoiceScreen(),
                      ),
                    );
                  },
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: provider.showBottomNav
              ? AnimatedBottomNavigationBar.builder(
                  gapWidth: 85,
                  itemCount: navItems.length,
                  backgroundColor: MyColors.color1,
                  activeIndex: provider.currentBtmNavScreenIndex,
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.smoothEdge,
                  leftCornerRadius: 0,
                  rightCornerRadius: 0,
                  splashSpeedInMilliseconds: 0,
                  scaleFactor: 0,
                  notchMargin: 8,
                  height: 63.5,
                  tabBuilder: (int index, bool isActive) {
                    final color = isActive
                        ? MyColors.primaryColor
                        : MyColors.white;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          navItems[index]['icon'],
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                          width: 20,
                          height: 20,
                        ),
                        MainText(
                          navItems[index]['label'],
                          color: color,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    );
                  },
                  onTap: (int index) {
                    provider.changeBottomNavScreen(newIndex: index);
                  },
                )
              : null,
        );
      },
    );
  }

  @override
  void dispose() {
    _resetCanPopTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainScaffold();
  }
}
