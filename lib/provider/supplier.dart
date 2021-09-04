import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/supplier.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getSuppliers(bool isRefresh) async {
    final gqClient = GQClient();

    if (!isRefresh) {
      state = state.setShouldHud(true);
    }

    final resp = await gqClient.query(QueryOptions(document: GetMeQuery().document));
    final decoded = GetMe$Query.fromJson(resp);
    state = state.setSuppliers(decoded.me.model().suppliers);

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }
}

class _State {
  final bool shouldShowHud;
  final List<Supplier> suppliers;

  _State({required this.shouldShowHud, required this.suppliers});

  static _State init() {
    return _State(shouldShowHud: false, suppliers: []);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, suppliers: suppliers);
  }

  _State setSuppliers(List<Supplier> items) {
    return _State(shouldShowHud: shouldShowHud, suppliers: items);
  }
}

final supplierProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
