import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:works_flutter/provider/auth.dart';
import 'package:works_flutter/ui/component/tabbar.dart';
import 'package:works_flutter/ui/invoice_history_list/invoice_history_list.dart';
import 'package:works_flutter/ui/setting/setting.dart';
import 'package:works_flutter/ui/supplier_list/supplier_list.dart';

import '../color.dart';

class RootPage extends HookWidget {
  static Widget init() {
    return RootPage();
  }

  late final PersistentTabController _tabController;
  final List<GlobalKey<NavigatorState>> globalKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    final authAction = useContext().read(authProvider.notifier);
    final tabIndex = useState(0);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        authAction.getMe();
      });

      _tabController = PersistentTabController(initialIndex: 0);

      return () {};
    }, const []);

    _tabController.index = tabIndex.value;

    return PersistentTabView.custom(
      context,
      controller: _tabController,
      screens: [
        SupplierListPage(globalKey: globalKeys[0]),
        InvoiceHistoryListPage(globalKey: globalKeys[1]),
        SettingPage.init(globalKeys[2])
      ],
      itemCount: 3,
      customWidget: CustomTabBar(
        items: [
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
        ],
        selectedIndex: _tabController.index,
        onItemSelected: (index) {
          if (_tabController.index == index) {
            Navigator.popUntil(globalKeys[index].currentContext!, (Route<dynamic> route) => route.isFirst);
            return;
          }

          tabIndex.value = index;
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
}
