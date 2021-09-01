import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';
import 'package:works_flutter/ui/login/provider.dart';
import 'package:works_flutter/ui/root/root.dart';
import 'package:works_flutter/ui/transition.dart';

class LoginPage extends HookWidget {
  static Widget init() {
    return LoginPage();
  }

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: ColorPalette.primary),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = useProvider(loginProvider);
    useEffect(() {}, const []);

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: state.shouldShowPincodeInput ? _buildPincodeInput() : _buildPhoneNumberInput(),
        inAsyncCall: state.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "ログイン").build(context),
      body: content,
    );
  }

  Widget _buildPhoneNumberInput() {
    final state = useProvider(loginProvider);
    final action = useContext().read(loginProvider.notifier);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldView(
                placeholder: "電話番号",
                value: state.phoneNumber?.val ?? "",
                inputType: TextInputType.phone,
                onSubmit: (val) {
                  action.setPhoneNumber(val);
                }),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ContainedButton(
                  text: "ログイン",
                  backgroundColor: ColorPalette.primary,
                  textColor: Colors.white,
                  onClick: () {
                    action.sendVerification();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPincodeInput() {
    final action = useContext().read(loginProvider.notifier);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: PinPut(
            eachFieldWidth: 50,
            eachFieldHeight: 55,
            pinAnimationType: PinAnimationType.none,
            fieldsCount: 6,
            onSubmit: (String pin) {
              action.setCode(pin);
              action.signIn().then((me) {
                if (me == null) {
                  return;
                }

                Transition().root(RootPage.init());
              });
            },
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration: _pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(5.0),
            ),
            selectedFieldDecoration: _pinPutDecoration,
            followingFieldDecoration: _pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: ColorPalette.border,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
