import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/me.dart';
import 'package:works_flutter/model/phone_number.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getMe() async {
    final gqClient = GQClient();

    state = state.setShouldHud(true);
    final resp = await gqClient.query(QueryOptions(document: GetMeQuery().document));
    final decoded = GetMe$Query.fromJson(resp);
    state = state.setShouldHud(false);
    state = state.setMe(decoded.me.model());
  }

  Future<bool> sendVerification(PhoneNumber phoneNumber) async {
    if (phoneNumber.val.isEmpty) {
      return false;
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.toE164(),
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

    return true;
  }

  Future<bool> signIn(String code) async {
    if (code.isEmpty) {
      return false;
    }

    state = state.setShouldHud(true);
    final credential = PhoneAuthProvider.credential(verificationId: state.verificationId, smsCode: code);
    await FirebaseAuth.instance.signInWithCredential(credential);
    state = state.setShouldHud(false);

    return true;
  }

  Future<bool> signOut() async {
    state = state.setShouldHud(true);
    await FirebaseAuth.instance.signOut();
    state = state.setShouldHud(false);
    state = state.setMe(null);

    return true;
  }
}

class _State {
  final bool shouldShowHud;
  final Me? me;
  final String verificationId;

  _State({required this.shouldShowHud, required this.me, required this.verificationId});

  static _State init() {
    return _State(shouldShowHud: false, me: null, verificationId: "");
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, me: me, verificationId: verificationId);
  }

  _State setMe(Me? me) {
    return _State(shouldShowHud: shouldShowHud, me: me, verificationId: verificationId);
  }

  _State setVerificationId(String id) {
    return _State(shouldShowHud: shouldShowHud, me: me, verificationId: id);
  }
}

final authProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
