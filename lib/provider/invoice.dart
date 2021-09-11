import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/errors.dart';
import 'package:works_flutter/model/invoice.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  int _page = 1;
  bool _isNextLoading = false;

  Future<void> initList(String supplierId, bool isRefresh) async {
    if (!isRefresh) {
      state = state.setShouldHud(true);
      state = state.setInvoices([]);
    }

    state = state.setHasNext(true);
    _page = 1;

    final payload = GetInvoiceListQuery(variables: GetInvoiceListArguments(supplierId: supplierId, page: _page, limit: 20));
    final resp = await GQClient().query(QueryOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = GetInvoiceList$Query.fromJson(resp);
    state = state.setInvoices(decoded.invoiceList.edges.map((v) => v.node.model()).toList());
    state = state.setHasNext(decoded.invoiceList.pageInfo.hasNextPage);

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }

  Future<void> nextList(String supplierId) async {
    if (_isNextLoading) {
      return;
    }

    _page += 1;
    _isNextLoading = true;

    final payload = GetInvoiceListQuery(variables: GetInvoiceListArguments(supplierId: supplierId, page: _page, limit: 20));
    final resp = await GQClient().query(QueryOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = GetInvoiceList$Query.fromJson(resp);
    final currentItems = state.invoices;
    currentItems.addAll(decoded.invoiceList.edges.map((v) => v.node.model()).toList());
    state = state.setInvoices(currentItems);
    state = state.setHasNext(decoded.invoiceList.pageInfo.hasNextPage);
    _isNextLoading = false;
  }

  Future<void> downloadPDF(String invoiceId) async {
    state = state.setShouldHud(true);
    state = state.setPDFDocument(null);

    final payload = DownloadInvoicePDFMutation(variables: DownloadInvoicePDFArguments(invoiceId: invoiceId));
    final resp = await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = DownloadInvoicePDF$Mutation.fromJson(resp);
    final doc = await PDFDocument.fromURL(decoded.downloadInvoicePdf);
    state = state.setPDFDocument(doc);

    state = state.setShouldHud(false);
  }

  Future<AppError?> delete(Invoice invoice) async {
    state = state.setShouldHud(true);

    final payload = DeleteInvoiceMutation(variables: DeleteInvoiceArguments(id: invoice.id));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));
    state = state.deleteInvoice(invoice);

    state = state.setShouldHud(false);
  }
}

class _State {
  final bool shouldShowHud;
  final List<Invoice> invoices;
  final bool hasNext;
  final PDFDocument? pdfDocument;

  _State({required this.shouldShowHud, required this.invoices, required this.hasNext, required this.pdfDocument});

  static _State init() {
    return _State(shouldShowHud: false, hasNext: true, invoices: [], pdfDocument: null);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, hasNext: hasNext, invoices: invoices, pdfDocument: pdfDocument);
  }

  _State setInvoices(List<Invoice> items) {
    return _State(shouldShowHud: shouldShowHud, hasNext: hasNext, invoices: items, pdfDocument: pdfDocument);
  }

  _State setHasNext(bool hasNext) {
    return _State(shouldShowHud: shouldShowHud, hasNext: hasNext, invoices: invoices, pdfDocument: pdfDocument);
  }

  _State setPDFDocument(PDFDocument? item) {
    return _State(shouldShowHud: shouldShowHud, hasNext: hasNext, invoices: invoices, pdfDocument: item);
  }

  _State deleteInvoice(Invoice item) {
    List<Invoice> current = invoices;
    current.removeWhere((v) => v.id == item.id);
    return _State(shouldShowHud: shouldShowHud, hasNext: hasNext, invoices: current, pdfDocument: null);
  }
}

final invoiceProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
