import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/invoice_history.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  int _page = 1;
  bool _isNextLoading = false;

  Future<void> initList(bool isRefresh) async {
    if (!isRefresh) {
      state = state.setShouldHud(true);
      state = state.setHistories([]);
    }

    state = state.setHasNext(true);
    _page = 1;

    final payload = GetInvoiceHistoryListQuery(variables: GetInvoiceHistoryListArguments(page: 1, limit: 20));
    final resp = await GQClient().query(QueryOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = GetInvoiceHistoryList$Query.fromJson(resp);
    state = state.setHistories(decoded.invoiceHistoryList.edges.map((v) => v.node.model()).toList());
    state = state.setHasNext(decoded.invoiceHistoryList.pageInfo.hasNextPage);

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }

  Future<void> nextList() async {
    if (_isNextLoading) {
      return;
    }

    _page += 1;
    _isNextLoading = true;

    final payload = GetInvoiceHistoryListQuery(variables: GetInvoiceHistoryListArguments(page: _page, limit: 20));
    final resp = await GQClient().query(QueryOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = GetInvoiceHistoryList$Query.fromJson(resp);
    final currentItems = state.histories;
    currentItems.addAll(decoded.invoiceHistoryList.edges.map((v) => v.node.model()).toList());
    state = state.setHistories(currentItems);
    state = state.setHasNext(decoded.invoiceHistoryList.pageInfo.hasNextPage);
    _isNextLoading = false;
  }
}

class _State {
  final bool shouldShowHud;
  final List<InvoiceHistory> histories;
  final bool hasNext;

  _State({required this.shouldShowHud, required this.histories, required this.hasNext});

  static _State init() {
    return _State(shouldShowHud: false, histories: [], hasNext: true);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, histories: histories, hasNext: hasNext);
  }

  _State setHistories(List<InvoiceHistory> items) {
    return _State(shouldShowHud: shouldShowHud, histories: items, hasNext: hasNext);
  }

  _State setHasNext(bool hasNext) {
    return _State(shouldShowHud: shouldShowHud, histories: histories, hasNext: hasNext);
  }
}

final invoiceHistoryProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
