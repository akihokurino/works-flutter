import 'package:flutter/material.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/invoice_history.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class InvoiceHistorySimpleItem extends StatelessWidget {
  final InvoiceHistory history;
  final VoidCallback onClick;

  InvoiceHistorySimpleItem({required this.history, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.border,
            width: 1,
          ),
        ),
      ),
      child: Material(
        color: ColorPalette.itemBackground,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text("${history.supplier.name} / ${history.invoice.totalAmount}円",
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 15,
                            )),
                        margin: EdgeInsets.only(bottom: 2),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text("支払い期日: ${history.invoice.paymentDueOnYMD}",
                                  style: TextStyle(
                                    color: ColorPalette.text,
                                    fontWeight: Font.normalWeight,
                                    fontSize: 14,
                                  )),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: history.invoice.paymentStatus == GraphQLPaymentStatus.unPaid
                                          ? ColorPalette.alertRed
                                          : ColorPalette.primary,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                  color: history.invoice.paymentStatus == GraphQLPaymentStatus.unPaid
                                      ? ColorPalette.alertRedBackground
                                      : ColorPalette.primaryBackground),
                              child: Text(history.invoice.paymentStatus == GraphQLPaymentStatus.unPaid ? "未支払" : "支払済",
                                  style: TextStyle(
                                    color: history.invoice.paymentStatus == GraphQLPaymentStatus.unPaid
                                        ? ColorPalette.alertRed
                                        : ColorPalette.primary,
                                    fontWeight: Font.normalWeight,
                                    fontSize: 12,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 2),
                              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: history.invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
                                          ? ColorPalette.alertRed
                                          : ColorPalette.primary,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                  color: history.invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
                                      ? ColorPalette.alertRedBackground
                                      : ColorPalette.primaryBackground),
                              child: Text(history.invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted ? "未請求" : "請求済",
                                  style: TextStyle(
                                    color: history.invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
                                        ? ColorPalette.alertRed
                                        : ColorPalette.primary,
                                    fontWeight: Font.normalWeight,
                                    fontSize: 12,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 15, color: ColorPalette.arrowIcon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
