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

class SupplierCreatePage extends HookWidget {
  static Widget init() {
    return SupplierCreatePage();
  }

  @override
  Widget build(BuildContext context) {
    final supplierState = useProvider(supplierProvider);
    final supplierAction = useContext().read(supplierProvider.notifier);
    final name = useState("");
    final subject = useState("");
    final subjectTemplate = useState("");
    final billingAmount = useState("");
    final billingTypeIndex = useState(0);
    final endYearIndex = useState(0);
    final endMonthIndex = useState(0);

    final billingTypeSelection = [
      GraphQLBillingType.monthly,
      GraphQLBillingType.oneTime,
    ];

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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: PickerFieldView(
                  label: "請求タイミング",
                  index: billingTypeIndex.value,
                  selection: billingTypeSelection.map((v) => v.text()).toList(),
                  onChange: (index) {
                    billingTypeIndex.value = index;
                  }),
            ),
            billingTypeIndex.value == 1
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
            billingTypeIndex.value == 1
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
                  text: "登録",
                  backgroundColor: ColorPalette.primary,
                  textColor: Colors.white,
                  onClick: () {
                    supplierAction
                        .create(
                            name.value,
                            subject.value,
                            subjectTemplate.value,
                            int.tryParse(billingAmount.value) ?? 0,
                            billingTypeSelection[billingTypeIndex.value],
                            yearSelection()[endYearIndex.value],
                            monthSelection()[endMonthIndex.value])
                        .then((err) {
                      if (err != null) {
                        AppDialog().showErrorAlert(context, err);
                        return;
                      }
                      Navigator.of(context).pop();
                    });
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
      appBar: AppBarFactory(title: "取引先登録").build(context),
      body: content,
    );
  }
}
