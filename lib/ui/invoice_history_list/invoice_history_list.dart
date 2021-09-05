import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/provider/invoice_history.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/invoice_history_list/invoice_history_normal_item.dart';
import 'package:works_flutter/ui/invoice_history_list/invoice_history_simple_item.dart';

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
  final _refreshNormalIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final _refreshSimpleIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final invoiceHistoryState = useProvider(invoiceHistoryProvider);
    final invoiceHistoryAction = useContext().read(invoiceHistoryProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        invoiceHistoryAction.getHistories(false);
      });

      return () {};
    }, const []);

    final normalList = () {
      return Container(
        child: NotificationListener(
          child: RefreshIndicator(
              key: _refreshNormalIndicatorKey,
              color: ColorPalette.primary,
              onRefresh: () async {
                await invoiceHistoryAction.getHistories(true);
              },
              child: Scrollbar(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  children: invoiceHistoryState.histories
                      .map((v) => Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: InvoiceHistoryNormalItem(history: v, onClick: () {}),
                          ))
                      .toList(),
                ),
              )),
          onNotification: (ScrollNotification notification) {
            return true;
          },
        ),
      );
    };

    final simpleList = () {
      return Container(
        child: NotificationListener(
          child: RefreshIndicator(
              key: _refreshSimpleIndicatorKey,
              color: ColorPalette.primary,
              onRefresh: () async {
                await invoiceHistoryAction.getHistories(true);
              },
              child: Scrollbar(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  children: invoiceHistoryState.histories.map((v) => InvoiceHistorySimpleItem(history: v, onClick: () {})).toList(),
                ),
              )),
          onNotification: (ScrollNotification notification) {
            return true;
          },
        ),
      );
    };

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: TabBarView(
            children: _tabs.map((tab) {
          switch (tab.text) {
            case _normalTab:
              return normalList();
            case _simpleTab:
              return simpleList();
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
