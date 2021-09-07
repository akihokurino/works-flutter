import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/supplier.dart';
import 'package:works_flutter/provider/invoice.dart';
import 'package:works_flutter/provider/supplier.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/font.dart';
import 'package:works_flutter/ui/invoice_detail/invoice_detail.dart';
import 'package:works_flutter/ui/supplier_detail/invoice_item.dart';
import 'package:works_flutter/ui/supplier_edit/supplier_edit.dart';
import 'package:works_flutter/ui/transition.dart';

class SupplierDetailPage extends HookWidget {
  static Widget init(String supplierId) {
    return SupplierDetailPage(supplierId: supplierId);
  }

  SupplierDetailPage({required this.supplierId});

  final String supplierId;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final supplierState = useProvider(supplierProvider);
    final supplierAction = useContext().read(supplierProvider.notifier);
    final invoiceState = useProvider(invoiceProvider);
    final invoiceAction = useContext().read(invoiceProvider.notifier);

    final supplier = () {
      try {
        return supplierState.suppliers.firstWhere((v) => v.id == supplierId);
      } catch (_) {
        return null;
      }
    }();

    if (supplier == null) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        Navigator.of(context).pop();
      });
      return ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
          ),
          child: Container(
            color: ColorPalette.background,
          ),
          inAsyncCall: true);
    }

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        invoiceAction.getList(supplier.id, false);
      });

      return () {};
    }, const []);

    List<Widget> list = [];
    list.add(Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorPalette.border,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text("請求タイミング",
                      style: TextStyle(
                        color: ColorPalette.textLight,
                        fontWeight: Font.normalWeight,
                        fontSize: 15,
                      )),
                  width: 150,
                ),
                Container(
                    child: Text(supplier.billingType.text(),
                        style: TextStyle(
                          color: supplier.billingType == GraphQLBillingType.monthly ? ColorPalette.primary : ColorPalette.green,
                          fontWeight: Font.boldWeight,
                          fontSize: 18,
                        )))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Text("請求額（税込）",
                        style: TextStyle(
                          color: ColorPalette.textLight,
                          fontWeight: Font.normalWeight,
                          fontSize: 15,
                        )),
                    width: 150),
                Container(
                    child: Text("${supplier.billingAmountIncludeTax}円（税込）",
                        style: TextStyle(
                          color: ColorPalette.text,
                          fontWeight: Font.boldWeight,
                          fontSize: 18,
                        )))
              ],
            ),
          ),
        ],
      ),
    ));

    list.addAll(invoiceState.invoices.map((v) => Container(
          margin: EdgeInsets.only(bottom: 15),
          child: InvoiceItem(
              invoice: v,
              onClick: () {
                Transition().pushWithTab(context, InvoiceDetailPage(invoice: v));
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
                  await invoiceAction.getList(supplier.id, true);
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
        inAsyncCall: invoiceState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: supplier.name, actions: [
        Container(
            child: IconButton(
                icon: Icon(Icons.settings),
                color: ColorPalette.primary,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            child: Text('編集'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Transition().pushWithTab(context, SupplierEditPage.init(supplier));
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text(
                              '削除',
                              style: TextStyle(color: ColorPalette.alertRed),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              supplierAction.delete(supplier).then((err) {
                                if (err != null) {
                                  AppDialog().showErrorAlert(context, err);
                                  return;
                                }
                              });
                            },
                          ),
                        ],
                        cancelButton: CupertinoButton(
                          child: Text('キャンセル'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      );
                    },
                  );
                }))
      ]).build(context),
      body: content,
    );
  }
}
