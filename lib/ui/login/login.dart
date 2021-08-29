import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/text_field_view.dart';

class LoginPage extends StatefulWidget {
  static Widget init() {
    return LoginPage();
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: ColorPalette.primary),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "ログイン").build(context),
      body: _buildPhoneNumberInput(),
    );
  }

  Widget _buildPhoneNumberInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldView(placeholder: "電話番号", inputType: TextInputType.phone),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ContainedButton(text: "ログイン", backgroundColor: ColorPalette.primary, textColor: Colors.white, onClick: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPincodeInput() {
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
            onSubmit: (String pin) {},
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
