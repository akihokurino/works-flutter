import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewProvider extends StateNotifier<_State> {
  LoginViewProvider() : super(_State(phoneNumber: "", code: ""));

  void setPhoneNumber(String phoneNumber) {
    state = _State(
      phoneNumber: phoneNumber,
      code: state.code,
    );
  }

  void sendVerification() {
    state = _State(phoneNumber: "", code: "");
  }
}

class _State {
  final String phoneNumber;
  final String code;

  _State({required this.phoneNumber, required this.code});
}

final loginProvider = StateNotifierProvider<LoginViewProvider, _State>((_) => LoginViewProvider());
