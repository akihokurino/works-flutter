import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/invoice.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getInvoices(String supplierId, bool isRefresh) async {
    if (!isRefresh) {
      state = state.setShouldHud(true);
      state = state.setInvoices([]);
    }

    final payload = GetInvoiceListQuery(variables: GetInvoiceListArguments(supplierId: supplierId));
    final resp = await GQClient().query(QueryOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = GetInvoiceList$Query.fromJson(resp);
    state = state.setInvoices(decoded.invoiceList.edges.map((v) => v.node.model()).toList());

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }
}

class _State {
  final bool shouldShowHud;
  final List<Invoice> invoices;

  _State({required this.shouldShowHud, required this.invoices});

  static _State init() {
    return _State(shouldShowHud: false, invoices: []);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, invoices: invoices);
  }

  _State setInvoices(List<Invoice> invoices) {
    return _State(shouldShowHud: shouldShowHud, invoices: invoices);
  }
}

final invoiceProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
