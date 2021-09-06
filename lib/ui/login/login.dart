import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:works_flutter/model/phone_number.dart';
import 'package:works_flutter/provider/auth.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';
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
    final authState = useProvider(authProvider);
    final authAction = useContext().read(authProvider.notifier);
    final shouldShowPincodeInput = useState(false);
    final phoneNumber = useState("");

    useEffect(() {
      return () {};
    }, const []);

    final phoneNumberInput = () {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldView(
                  placeholder: "電話番号",
                  value: phoneNumber.value,
                  inputType: TextInputType.phone,
                  onSubmit: (val) {
                    phoneNumber.value = val;
                  }),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ContainedButton(
                    text: "ログイン",
                    backgroundColor: ColorPalette.primary,
                    textColor: Colors.white,
                    onClick: () {
                      authAction.sendVerification(PhoneNumber(val: phoneNumber.value)).then((err) {
                        if (err != null) {
                          AppDialog().showErrorAlert(context, err);
                          return;
                        }
                        shouldShowPincodeInput.value = true;
                      });
                    }),
              ),
            ],
          ),
        ),
      );
    };

    final pincodeInput = () {
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
                authAction.signIn(pin).then((err) {
                  if (err != null) {
                    AppDialog().showErrorAlert(context, err);
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
    };

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: shouldShowPincodeInput.value ? pincodeInput() : phoneNumberInput(),
        inAsyncCall: authState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "ログイン").build(context),
      body: content,
    );
  }
}
