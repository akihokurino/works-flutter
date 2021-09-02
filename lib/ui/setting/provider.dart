import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> signOut() async {
    state = state.setShouldHud(true);
    await FirebaseAuth.instance.signOut();
    state = state.setShouldHud(false);
  }
}

class _State {
  final bool shouldShowHud;

  _State({required this.shouldShowHud});

  static _State init() {
    return _State(shouldShowHud: false);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should);
  }
}

final settingProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
