import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/model/bank.dart';
import 'package:works_flutter/provider/auth.dart';
import 'package:works_flutter/provider/bank.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/component/picker_view.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';

class BankEditPage extends HookWidget {
  static Widget init(Bank? bank) {
    return BankEditPage(
      bank: bank,
    );
  }

  BankEditPage({required this.bank});

  final Bank? bank;

  final accountTypeSelection = [
    GraphQLBankAccountType.savings,
    GraphQLBankAccountType.checking,
  ];

  @override
  Widget build(BuildContext context) {
    final bankState = useProvider(bankProvider);
    final bankAction = useContext().read(bankProvider.notifier);
    final authAction = useContext().read(authProvider.notifier);

    final name = useState(bank?.name ?? "");
    final code = useState(bank?.code ?? "");
    final accountTypeIndex = useState(bank?.accountType == GraphQLBankAccountType.checking ? 1 : 0);
    final accountNumber = useState(bank?.accountNumber ?? "");
    final isDeleted = useState(false);

    if (isDeleted.value) {
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
      return () {};
    }, const []);

    final form = () {
      return Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              child: TextFieldView(
                  label: "銀行支店名",
                  value: name.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    name.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "店番号",
                  value: code.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    code.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: PickerFieldView(
                  label: "口座種別",
                  index: accountTypeIndex.value,
                  selection: accountTypeSelection.map((v) => v.text()).toList(),
                  onChange: (index) {
                    accountTypeIndex.value = index;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "口座番号",
                  value: accountNumber.value,
                  inputType: TextInputType.number,
                  onSubmit: (val) {
                    accountNumber.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ContainedButton(
                  text: "更新",
                  backgroundColor: ColorPalette.primary,
                  textColor: Colors.white,
                  onClick: () async {
                    final err =
                        await bankAction.update(name.value, code.value, accountTypeSelection[accountTypeIndex.value], accountNumber.value);
                    if (err != null) {
                      AppDialog().showErrorAlert(context, err);
                      return;
                    }

                    await authAction.getMe();
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
        inAsyncCall: bankState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "自社", actions: [
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
                            child: Text(
                              '削除',
                              style: TextStyle(color: ColorPalette.alertRed),
                            ),
                            onPressed: () async {
                              if (bank == null) {
                                return;
                              }

                              Navigator.of(context).pop();

                              final err = await bankAction.delete(bank!);
                              if (err != null) {
                                AppDialog().showErrorAlert(context, err);
                                return;
                              }

                              await authAction.getMe();
                              isDeleted.value = true;
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
