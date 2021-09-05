import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/model/invoice.dart';
import 'package:works_flutter/provider/invoice.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';

class InvoiceDetailPage extends HookWidget {
  static Widget init(Invoice invoice) {
    return InvoiceDetailPage(invoice: invoice);
  }

  InvoiceDetailPage({required this.invoice});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    final invoiceState = useProvider(invoiceProvider);
    final invoiceAction = useContext().read(invoiceProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        invoiceAction.downloadPDF(invoice.id);
      });

      return () {};
    }, const []);

    final pdfViewer = () {
      if (invoiceState.pdfDocument == null) {
        return Container();
      }

      return PDFViewer(document: invoiceState.pdfDocument!);
    };

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: pdfViewer(),
        inAsyncCall: invoiceState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "請求書").build(context),
      body: content,
    );
  }
}
