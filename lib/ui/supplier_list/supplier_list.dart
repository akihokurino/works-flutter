import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/provider/supplier.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/font.dart';
import 'package:works_flutter/ui/supplier_detail/supplier_detail.dart';
import 'package:works_flutter/ui/supplier_list/supplier_item.dart';
import 'package:works_flutter/ui/transition.dart';

class SupplierListPage extends HookWidget {
  static Widget init(GlobalKey<NavigatorState> globalKey) {
    return SupplierListPage(globalKey: globalKey);
  }

  SupplierListPage({required this.globalKey});

  final GlobalKey<NavigatorState> globalKey;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final supplierState = useProvider(supplierProvider);
    final supplierAction = useContext().read(supplierProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        supplierAction.getSuppliers(false);
      });
    }, const []);

    final totalAmount =
        supplierState.suppliers.isNotEmpty ? supplierState.suppliers.map((v) => v.billingAmountIncludeTax).reduce((v1, v2) => v1 + v2) : 0;

    List<Widget> list = [];
    list.add(Container(
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
            child: Text("$totalAmount円",
                style: TextStyle(
                  color: ColorPalette.text,
                  fontWeight: Font.boldWeight,
                  fontSize: 30,
                )),
          )
        ],
      ),
    ));

    list.addAll(supplierState.suppliers.map((v) => Container(
          margin: EdgeInsets.only(bottom: 15),
          child: SupplierItem(
              supplier: v,
              onClick: () {
                Transition().pushWithTab(context, SupplierDetailPage(supplier: v));
              }),
        )));

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: Container(
          child: NotificationListener(
            child: RefreshIndicator(
                key: _refreshIndicatorKey,
                color: ColorPalette.primary,
                onRefresh: () async {
                  await supplierAction.getSuppliers(true);
                },
                child: Scrollbar(
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    children: list,
                  ),
                )),
            onNotification: (ScrollNotification notification) {
              return true;
            },
          ),
        ),
        inAsyncCall: supplierState.shouldShowHud);

    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "取引先").build(context),
      body: content,
    );
  }
}
