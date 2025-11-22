import 'package:flutter/material.dart';

import '../../home/home.dart';

class LayoutProvider extends ChangeNotifier {

  LayoutProvider() {
    widgetInBody = const HomeScreen();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currentBtmNavScreenIndex = 0;
  bool showBottomNav = true;

  List<Widget> navScreens = [HomeScreen(), const Scaffold()];

  late Widget widgetInBody;

  void changeBottomNavScreen({required int newIndex}) {
    if (newIndex >= 0 && newIndex < navScreens.length) {
      currentBtmNavScreenIndex = newIndex;
      widgetInBody = navScreens[currentBtmNavScreenIndex];
      showBottomNav = true;
      notifyListeners();
    }
  }

  void toggleShowBottomNav(bool value) {
    if (showBottomNav != value) {
      showBottomNav = value;
      notifyListeners();
    }
  }

  void refresh() {
    notifyListeners();
  }
}
