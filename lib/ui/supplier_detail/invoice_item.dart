import 'package:flutter/material.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/invoice.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class InvoiceItem extends StatelessWidget {
  final Invoice invoice;
  final VoidCallback onClick;

  InvoiceItem({required this.invoice, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.border, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: ColorPalette.itemBackground,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.history,
                    size: 40,
                    color: ColorPalette.iconGray,
                  ),
                  margin: EdgeInsets.only(right: 15),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(invoice.subject,
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 15,
                            )),
                        margin: EdgeInsets.only(bottom: 2),
                      ),
                      Container(
                        child: Text("${invoice.totalAmountIncludeTax()}円（税込）",
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.boldWeight,
                              fontSize: 15,
                            )),
                      ),
                      Container(
                        child: Text("発行日: ${invoice.issueYMD}",
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 15,
                            )),
                        margin: EdgeInsets.only(bottom: 2),
                      ),
                      Container(
                        child: Text("支払い期日: ${invoice.paymentDueOnYMD}",
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 15,
                            )),
                        margin: EdgeInsets.only(bottom: 4),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: invoice.paymentStatus == GraphQLPaymentStatus.unPaid
                                          ? ColorPalette.alertRed
                                          : ColorPalette.primary,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                  color: invoice.paymentStatus == GraphQLPaymentStatus.unPaid
                                      ? ColorPalette.alertRedBackground
                                      : ColorPalette.primaryBackground),
                              child: Text(invoice.paymentStatus == GraphQLPaymentStatus.unPaid ? "未支払" : "支払済",
                                  style: TextStyle(
                                    color:
                                        invoice.paymentStatus == GraphQLPaymentStatus.unPaid ? ColorPalette.alertRed : ColorPalette.primary,
                                    fontWeight: Font.normalWeight,
                                    fontSize: 12,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 2),
                              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
                                          ? ColorPalette.alertRed
                                          : ColorPalette.primary,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                  color: invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
                                      ? ColorPalette.alertRedBackground
                                      : ColorPalette.primaryBackground),
                              child: Text(invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted ? "未請求" : "請求済",
                                  style: TextStyle(
                                    color: invoice.invoiceStatus == GraphQLInvoiceStatus.unSubmitted
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
