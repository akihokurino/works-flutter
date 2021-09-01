import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/model/me.dart';
import 'package:works_flutter/model/phone_number.dart';

class LoginViewProvider extends StateNotifier<_State> {
  LoginViewProvider() : super(_State(phoneNumber: null, verificationId: "", code: "", shouldShowPincodeInput: false, shouldShowHud: false));

  void setPhoneNumber(String phoneNumber) {
    state = state.setPhoneNumber(phoneNumber);
  }

  void setCode(String code) {
    state = state.setCode(code);
  }

  Future<void> sendVerification() async {
    if (state.phoneNumber == null) {
      return;
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: state.phoneNumber!.toE164(),
      timeout: Duration(seconds: 5),
      codeSent: (String verificationId, int? resendToken) async {
        state = state.setVerificationId(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        state = state.setVerificationId(verificationId);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }

  Future<Me?> signIn() async {
    if (state.code.isEmpty) {
      return null;
    }

    state = state.setShouldHud(true);

    final credential = PhoneAuthProvider.credential(verificationId: state.verificationId, smsCode: state.code);
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    final user = result.user;
    return Me(id: user!.uid);
  }
}

class _State {
  final PhoneNumber? phoneNumber;
  final String verificationId;
  final String code;
  final bool shouldShowPincodeInput;
  final bool shouldShowHud;

  _State(
      {required this.phoneNumber,
      required this.verificationId,
      required this.code,
      required this.shouldShowPincodeInput,
      required this.shouldShowHud});

  _State setShouldHud(bool should) {
    return _State(
        phoneNumber: phoneNumber,
        verificationId: verificationId,
        code: code,
        shouldShowPincodeInput: shouldShowPincodeInput,
        shouldShowHud: should);
  }

  _State setPhoneNumber(String val) {
    return _State(
        phoneNumber: PhoneNumber(val: val),
        verificationId: verificationId,
        code: code,
        shouldShowPincodeInput: shouldShowPincodeInput,
        shouldShowHud: false);
  }

  _State setCode(String val) {
    return _State(
        phoneNumber: phoneNumber,
        verificationId: verificationId,
        code: val,
        shouldShowPincodeInput: shouldShowPincodeInput,
        shouldShowHud: false);
  }

  _State setVerificationId(String val) {
    return _State(phoneNumber: phoneNumber, verificationId: val, code: "", shouldShowPincodeInput: true, shouldShowHud: false);
  }
}

final loginProvider = StateNotifierProvider<LoginViewProvider, _State>((_) => LoginViewProvider());
