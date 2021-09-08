import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/provider/auth.dart';
import 'package:works_flutter/ui/bank_edit/bank_edit.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/login/login.dart';
import 'package:works_flutter/ui/sender_edit/sender_edit.dart';
import 'package:works_flutter/ui/setting/menu_item.dart';
import 'package:works_flutter/ui/transition.dart';

class SettingPage extends HookWidget {
  final GlobalKey<NavigatorState> globalKey;

  static Widget init(GlobalKey<NavigatorState> globalKey) {
    return SettingPage(globalKey: globalKey);
  }

  SettingPage({required this.globalKey});

  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authProvider);
    final authAction = useContext().read(authProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        authAction.getMe();
      });

      return () {};
    }, const []);

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MenuItem(
                    text: "振込先",
                    onClick: () {
                      Transition().pushWithTab(context, BankEditPage.init(authState.me?.bank));
                    }),
                MenuItem(
                    text: "自社",
                    onClick: () {
                      Transition().pushWithTab(context, SenderEditPage.init(authState.me?.sender));
                    }),
                MenuItem(text: "Misoca接続", onClick: () {}),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: ContainedButton(
                    text: "ログアウト",
                    backgroundColor: ColorPalette.alertRed,
                    textColor: Colors.white,
                    onClick: () {
                      authAction.signOut().then((err) {
                        if (err != null) {
                          AppDialog().showErrorAlert(context, err);
                          return;
                        }
                        Transition().root(LoginPage.init());
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        inAsyncCall: authState.shouldShowHud);

    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "設定", isDisableBack: true).build(context),
      body: content,
    );
  }
}
