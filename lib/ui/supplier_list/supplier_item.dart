import 'package:flutter/material.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/supplier.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class SupplierItem extends StatelessWidget {
  final Supplier supplier;
  final VoidCallback onClick;

  SupplierItem({required this.supplier, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.border, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: supplier.billingType == GraphQLBillingType.monthly
            ? ColorPalette.primaryBackground
            : ColorPalette.okGreen.withOpacity(0.1),
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
                    Icons.apartment,
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
                        child: Text(supplier.name,
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 15,
                            )),
                        margin: EdgeInsets.only(bottom: 2),
                      ),
                      Container(
                        child: Text("${supplier.billingAmountIncludeTax}（税込）",
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.boldWeight,
                              fontSize: 15,
                            )),
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
