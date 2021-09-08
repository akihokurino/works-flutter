import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/model/sender.dart';
import 'package:works_flutter/provider/auth.dart';
import 'package:works_flutter/provider/sender.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';

class SenderEditPage extends HookWidget {
  static Widget init(Sender? sender) {
    return SenderEditPage(
      sender: sender,
    );
  }

  SenderEditPage({required this.sender});

  final Sender? sender;

  @override
  Widget build(BuildContext context) {
    final senderState = useProvider(senderProvider);
    final senderAction = useContext().read(senderProvider.notifier);
    final authAction = useContext().read(authProvider.notifier);

    final name = useState(sender?.name ?? "");
    final email = useState(sender?.email ?? "");
    final tel = useState(sender?.tel ?? "");
    final postalCode = useState(sender?.postalCode ?? "");
    final address = useState(sender?.address ?? "");
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
                  label: "自社名",
                  value: name.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    name.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "メールアドレス",
                  value: email.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    email.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "電話番号",
                  value: tel.value,
                  inputType: TextInputType.text,
                  onSubmit: (val) {
                    tel.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "郵便番号",
                  value: postalCode.value,
                  inputType: TextInputType.number,
                  onSubmit: (val) {
                    postalCode.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFieldView(
                  label: "住所",
                  value: address.value,
                  inputType: TextInputType.number,
                  onSubmit: (val) {
                    address.value = val;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ContainedButton(
                  text: "更新",
                  backgroundColor: ColorPalette.primary,
                  textColor: Colors.white,
                  onClick: () async {
                    final err = await senderAction.update(name.value, email.value, tel.value, postalCode.value, address.value);
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
        inAsyncCall: senderState.shouldShowHud);

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
                              if (sender == null) {
                                return;
                              }

                              Navigator.of(context).pop();

                              final err = await senderAction.delete(sender!);
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
