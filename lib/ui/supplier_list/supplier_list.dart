import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/font.dart';
import 'package:works_flutter/ui/root/provider.dart';
import 'package:works_flutter/ui/supplier_list/supplier_item.dart';

class SupplierListPage extends HookWidget {
  final GlobalKey<NavigatorState> globalKey;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  static Widget init(GlobalKey<NavigatorState> globalKey) {
    return SupplierListPage(globalKey: globalKey);
  }

  SupplierListPage({required this.globalKey});

  @override
  Widget build(BuildContext context) {
    useEffect(() {}, const []);

    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "取引先").build(context),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    final state = useProvider(rootProvider);
    final suppliers = state.me?.suppliers ?? [];

    List<Widget> widgets = [];
    widgets.add(Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: [
          Container(
            child: Text("月額の合計額（税込）",
                style: TextStyle(
                  color: ColorPalette.text,
                  fontWeight: Font.normalWeight,
                  fontSize: 15,
                )),
          ),
          Container(
            child: Text("${suppliers.map((v) => v.billingAmountIncludeTax).reduce((v1, v2) => v1 + v2)}円",
                style: TextStyle(
                  color: ColorPalette.text,
                  fontWeight: Font.boldWeight,
                  fontSize: 30,
                )),
          )
        ],
      ),
    ));

    widgets.addAll(suppliers.map((v) => Container(
          margin: EdgeInsets.only(bottom: 15),
          child: SupplierItem(supplier: v, onClick: () {}),
        )));

    return Container(
      child: NotificationListener(
        child: RefreshIndicator(
            key: _refreshIndicatorKey,
            color: ColorPalette.primary,
            onRefresh: _onRefresh,
            child: Scrollbar(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: widgets,
              ),
            )),
        onNotification: (ScrollNotification notification) {
          return true;
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
