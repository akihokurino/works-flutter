import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/invoice_history.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getList(bool isRefresh) async {
    if (!isRefresh) {
      state = state.setShouldHud(true);
    }

    final payload = GetInvoiceHistoryListQuery();
    final resp = await GQClient().query(QueryOptions(document: payload.document));
    final decoded = GetInvoiceHistoryList$Query.fromJson(resp);
    state = state.setHistories(decoded.invoiceHistoryList.edges.map((v) => v.node.model()).toList());

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }
}

class _State {
  final bool shouldShowHud;
  final List<InvoiceHistory> histories;

  _State({required this.shouldShowHud, required this.histories});

  static _State init() {
    return _State(shouldShowHud: false, histories: []);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, histories: histories);
  }

  _State setHistories(List<InvoiceHistory> histories) {
    return _State(shouldShowHud: shouldShowHud, histories: histories);
  }
}

final invoiceHistoryProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
