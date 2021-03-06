import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/errors.dart';
import 'package:works_flutter/model/me.dart';
import 'package:works_flutter/model/phone_number.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getMe() async {
    state = state.setShouldHud(true);
    final payload = GetMeQuery();
    final resp = await GQClient().query(QueryOptions(document: payload.document));
    final decoded = GetMe$Query.fromJson(resp);
    state = state.setShouldHud(false);
    state = state.setMe(decoded.me.model());
  }

  Future<AppError?> sendVerification(PhoneNumber phoneNumber) async {
    if (phoneNumber.val.isEmpty) {
      return AppError("電話番号を入力してください");
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
  }

  Future<AppError?> signIn(String code) async {
    if (code.isEmpty) {
      return AppError("コードを入力してください");
    }

    state = state.setShouldHud(true);

    final credential = PhoneAuthProvider.credential(verificationId: state.verificationId, smsCode: code);
    await FirebaseAuth.instance.signInWithCredential(credential);

    final payload = AuthenticateMutation();
    await GQClient().mutation(MutationOptions(document: payload.document));

    state = state.setShouldHud(false);
  }

  Future<AppError?> signOut() async {
    state = state.setShouldHud(true);

    await FirebaseAuth.instance.signOut();

    state = state.setShouldHud(false);
    state = state.setMe(null);
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
