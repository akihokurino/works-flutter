import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/provider/invoice_history.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';

const _normalTab = "通常";
const _simpleTab = "簡易";

class InvoiceHistoryListPage extends HookWidget {
  static Widget init(GlobalKey<NavigatorState> globalKey) {
    return InvoiceHistoryListPage(globalKey: globalKey);
  }

  InvoiceHistoryListPage({required this.globalKey});

  final GlobalKey<NavigatorState> globalKey;
  final List<Tab> _tabs = [
    Tab(
      text: _normalTab,
    ),
    Tab(
      text: _simpleTab,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final invoiceHistoryState = useProvider(invoiceHistoryProvider);

    useEffect(() {}, const []);

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: TabBarView(
            children: _tabs.map((tab) {
          switch (tab.text) {
            case _normalTab:
              return Container();
            case _simpleTab:
              return Container();
            default:
              return Container();
          }
        }).toList()),
        inAsyncCall: invoiceHistoryState.shouldShowHud);

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          key: globalKey,
          backgroundColor: Colors.white,
          appBar: AppBarFactory(
              title: "履歴",
              tab: TabBar(
                isScrollable: false,
                tabs: _tabs,
                unselectedLabelColor: ColorPalette.text,
                indicatorColor: ColorPalette.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                labelColor: ColorPalette.primary,
              )).build(context),
          body: content,
        ));
  }
}
