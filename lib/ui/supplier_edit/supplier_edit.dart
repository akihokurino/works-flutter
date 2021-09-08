import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/supplier.dart';
import 'package:works_flutter/provider/supplier.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/component/picker_view.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';

class SupplierEditPage extends HookWidget {
  static Widget init(Supplier supplier) {
    return SupplierEditPage(supplier: supplier);
  }

  SupplierEditPage({required this.supplier});

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    final supplierState = useProvider(supplierProvider);
    final supplierAction = useContext().read(supplierProvider.notifier);
    final name = useState(supplier.name);
    final subject = useState(supplier.subject);
    final subjectTemplate = useState(supplier.subjectTemplate);
    final billingAmount = useState(supplier.billingAmountExcludeTax.toString());

    final yearSelection = () {
      int year = DateTime.now().year;
      List<int> results = [];
      for (int i = 0; i < 10; i++) {
        results.add(year + i);
      }
      return results;
    };

    final monthSelection = () {
      List<int> results = [];
      for (int i = 1; i <= 12; i++) {
        results.add(i);
      }
      return results;
    };

    int _endYearIndex = 0;
    if (supplier.billingType == GraphQLBillingType.oneTime) {
      _endYearIndex = max(yearSelection().indexWhere((v) => v == supplier.endYear()!), 0);
    }

    int _endMonthIndex = 0;
    if (supplier.billingType == GraphQLBillingType.oneTime) {
      _endMonthIndex = max(monthSelection().indexWhere((v) => v == supplier.endMonth()!), 0);
    }

    final endYearIndex = useState(_endYearIndex);
    final endMonthIndex = useState(_endMonthIndex);

    useEffect(() {
      return () {};
    }, const []);

    final form = () {
      return Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              child: TextFieldView(
                  label: "取引先名",
                  value: name.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    name.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "件名",
                  value: subject.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    subject.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "件名テンプレート",
                  value: subjectTemplate.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    subjectTemplate.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "請求額",
                  value: billingAmount.value,
                  inputType: TextInputType.number,
                  onSubmit: (val) {
                    billingAmount.value = val;
                  }),
            ),
            supplier.billingType == GraphQLBillingType.oneTime
                ? Container(
                    margin: EdgeInsets.only(top: 20),
                    child: PickerFieldView(
                        label: "契約終了年（納品時請求のみ）",
                        index: endYearIndex.value,
                        selection: yearSelection().map((v) => "$v年").toList(),
                        onChange: (index) {
                          endYearIndex.value = index;
                        }),
                  )
                : Container(),
            supplier.billingType == GraphQLBillingType.oneTime
                ? Container(
                    margin: EdgeInsets.only(top: 20),
                    child: PickerFieldView(
                        label: "契約終了月（納品時請求のみ）",
                        index: endMonthIndex.value,
                        selection: monthSelection().map((v) => "$v月").toList(),
                        onChange: (index) {
                          endMonthIndex.value = index;
                        }),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ContainedButton(
                  text: "更新",
                  backgroundColor: ColorPalette.primary,
                  textColor: Colors.white,
                  onClick: () async {
                    final err = await supplierAction.update(supplier, name.value, subject.value, subjectTemplate.value,
                        int.tryParse(billingAmount.value) ?? 0, yearSelection()[endYearIndex.value], monthSelection()[endMonthIndex.value]);
                    if (err != null) {
                      AppDialog().showErrorAlert(context, err);
                      return;
                    }

                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      );
    };

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: form(),
        inAsyncCall: supplierState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "取引先更新").build(context),
      body: content,
    );
  }
}
