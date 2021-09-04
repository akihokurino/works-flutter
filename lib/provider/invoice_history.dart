import 'package:hooks_riverpod/hooks_riverpod.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());
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

final invoiceHistoryProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
