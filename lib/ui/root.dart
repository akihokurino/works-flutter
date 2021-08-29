import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:works_flutter/ui/tabbar.dart';

import 'color.dart';

class RootPage extends StatefulWidget {
  static Widget init() {
    return RootPage();
  }

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late final PersistentTabController _tabController;
  final List<GlobalKey<NavigatorState>> globalKeys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

  @override
  void initState() {
    super.initState();

    _tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens();

    return PersistentTabView.custom(
      context,
      controller: _tabController,
      screens: screens,
      itemCount: screens.length,
      customWidget: CustomTabBar(
        items: _buildTabs(),
        selectedIndex: _tabController.index,
        onItemSelected: (index) {
          if (_tabController.index == index) {
            Navigator.popUntil(globalKeys[index].currentContext!, (Route<dynamic> route) => route.isFirst);
            return;
          }

          setState(() {
            _tabController.index = index;
          });
        },
      ),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      screenTransitionAnimation: ScreenTransitionAnimation(animateTabTransition: false),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.amberAccent,
      ),
      Container(
        color: Colors.greenAccent,
      )
    ];
  }

  List<PersistentBottomNavBarItem> _buildTabs() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.apartment),
        title: "取引先",
        activeColorPrimary: ColorPalette.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: "履歴",
        activeColorPrimary: ColorPalette.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: "設定",
        activeColorPrimary: ColorPalette.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
