import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/supplier.dart';
import 'package:works_flutter/provider/invoice.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/font.dart';
import 'package:works_flutter/ui/supplier_detail/invoice_item.dart';

class SupplierDetailPage extends HookWidget {
  static Widget init(Supplier supplier) {
    return SupplierDetailPage(supplier: supplier);
  }

  SupplierDetailPage({required this.supplier});

  final Supplier supplier;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final invoiceState = useProvider(invoiceProvider);
    final invoiceAction = useContext().read(invoiceProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        invoiceAction.getInvoices(supplier.id, false);
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
                    child: Text(supplier.billingTypeText(),
                        style: TextStyle(
                          color: supplier.billingType == GraphQLBillingType.monthly ? ColorPalette.primary : ColorPalette.okGreen,
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
          child: InvoiceItem(invoice: v, onClick: () {}),
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
                  await invoiceAction.getInvoices(supplier.id, true);
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
      appBar: AppBarFactory(title: supplier.name).build(context),
      body: content,
    );
  }
}
