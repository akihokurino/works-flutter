import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/provider/invoice_history.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/invoice_detail/invoice_detail.dart';
import 'package:works_flutter/ui/invoice_history_list/invoice_history_normal_item.dart';
import 'package:works_flutter/ui/invoice_history_list/invoice_history_simple_item.dart';
import 'package:works_flutter/ui/transition.dart';

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
        invoiceHistoryAction.initList(false);
      });

      return () {};
    }, const []);

    final normalList = () {
      List<Widget> list = [];
      list.addAll(invoiceHistoryState.histories
          .map((v) => Container(
                margin: EdgeInsets.only(bottom: 15),
                child: InvoiceHistoryNormalItem(
                    history: v,
                    onClick: () {
                      Transition().pushWithTab(
                          context,
                          InvoiceDetailPage(
                              invoice: v.invoice,
                              onDelete: () {
                                invoiceHistoryAction.initList(false);
                              }));
                    }),
              ))
          .toList());

      if (invoiceHistoryState.hasNext && invoiceHistoryState.histories.length > 0) {
        list.add(Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            width: 32.0,
            height: 32.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
            ),
          ),
        ));
      }

      return Container(
        child: NotificationListener(
          child: RefreshIndicator(
              key: _refreshNormalIndicatorKey,
              color: ColorPalette.primary,
              onRefresh: () async {
                await invoiceHistoryAction.initList(true);
              },
              child: Scrollbar(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  children: list,
                ),
              )),
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent && invoiceHistoryState.hasNext) {
              invoiceHistoryAction.nextList();
            }
            return true;
          },
        ),
      );
    };

    final simpleList = () {
      List<Widget> list = [];
      list.addAll(invoiceHistoryState.histories
          .map((v) => InvoiceHistorySimpleItem(
              history: v,
              onClick: () {
                Transition().pushWithTab(
                    context,
                    InvoiceDetailPage(
                        invoice: v.invoice,
                        onDelete: () {
                          invoiceHistoryAction.initList(false);
                        }));
              }))
          .toList());

      if (invoiceHistoryState.hasNext && invoiceHistoryState.histories.length > 0) {
        list.add(Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            width: 32.0,
            height: 32.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
            ),
          ),
        ));
      }

      return Container(
        child: NotificationListener(
          child: RefreshIndicator(
              key: _refreshSimpleIndicatorKey,
              color: ColorPalette.primary,
              onRefresh: () async {
                await invoiceHistoryAction.initList(true);
              },
              child: Scrollbar(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  children: list,
                ),
              )),
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent && invoiceHistoryState.hasNext) {
              invoiceHistoryAction.nextList();
            }
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
                  ),
                  isDisableBack: true)
              .build(context),
          body: content,
        ));
  }
}
