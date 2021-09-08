import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/errors.dart';
import 'package:works_flutter/model/sender.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<AppError?> update(String name, String email, String tel, String postalCode, String address) async {
    if (name.isEmpty || email.isEmpty || tel.isEmpty || postalCode.isEmpty || address.isEmpty) {
      return AppError("不正な入力です");
    }

    state = state.setShouldHud(true);

    final payload = RegisterSenderMutation(
        variables: RegisterSenderArguments(
      name: name,
      email: email,
      tel: tel,
      postalCode: postalCode,
      address: address,
    ));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));

    state = state.setShouldHud(false);
  }

  Future<AppError?> delete(Sender sender) async {
    state = state.setShouldHud(true);

    final payload = DeleteSenderMutation(variables: DeleteSenderArguments(id: sender.id));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));

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

final senderProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
