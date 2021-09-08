import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/errors.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<AppError?> connect(String code) async {
    if (code.isEmpty) {
      return AppError("不正な入力です");
    }

    state = state.setShouldHud(true);

    final payload = ConnectMisocaMutation(
        variables: ConnectMisocaArguments(
      code: code,
    ));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));

    state = state.setShouldHud(false);
  }

  Future<AppError?> refresh() async {
    state = state.setShouldHud(true);

    final payload = RefreshMisocaMutation();
    await GQClient().mutation(MutationOptions(document: payload.document));

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

final misocaProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
