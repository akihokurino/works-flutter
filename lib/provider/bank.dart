import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/bank.dart';
import 'package:works_flutter/model/errors.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<AppError?> update(String name, String code, GraphQLBankAccountType accountType, String accountNumber) async {
    if (name.isEmpty || code.isEmpty || accountNumber.isEmpty) {
      return AppError("不正な入力です");
    }

    state = state.setShouldHud(true);

    final payload = RegisterBankMutation(
        variables: RegisterBankArguments(
      name: name,
      code: code,
      accountType: accountType,
      accountNumber: accountNumber,
    ));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));

    state = state.setShouldHud(false);
  }

  Future<AppError?> delete(Bank bank) async {
    state = state.setShouldHud(true);

    final payload = DeleteBankMutation(variables: DeleteBankArguments(id: bank.id));
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

final bankProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
