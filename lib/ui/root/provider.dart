import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/me.dart';

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

  void changeTab(int index) {
    state = state.setTabIndex(index);
  }
}

class _State {
  final bool shouldShowHud;
  final Me? me;
  final int tabIndex;

  _State({required this.shouldShowHud, required this.me, required this.tabIndex});

  static _State init() {
    return _State(shouldShowHud: false, me: null, tabIndex: 0);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, me: me, tabIndex: tabIndex);
  }

  _State setMe(Me me) {
    return _State(shouldShowHud: shouldShowHud, me: me, tabIndex: tabIndex);
  }

  _State setTabIndex(int index) {
    return _State(shouldShowHud: shouldShowHud, me: me, tabIndex: index);
  }
}

final rootProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
