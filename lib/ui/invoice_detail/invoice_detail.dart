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
import 'package:works_flutter/ui/component/dialog.dart';

class InvoiceDetailPage extends HookWidget {
  static Widget init(Invoice invoice, Function? onDelete) {
    return InvoiceDetailPage(invoice: invoice, onDelete: onDelete);
  }

  InvoiceDetailPage({required this.invoice, this.onDelete});

  final Invoice invoice;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    final invoiceState = useProvider(invoiceProvider);
    final invoiceAction = useContext().read(invoiceProvider.notifier);
    final isDeleted = useState(false);

    if (isDeleted.value) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        if (onDelete != null) {
          onDelete!();
        }
        Navigator.of(context).pop();
      });
      return ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
          ),
          child: Container(
            color: ColorPalette.background,
          ),
          inAsyncCall: true);
    }

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
      appBar: AppBarFactory(title: "請求書", actions: [
        Container(
            child: IconButton(
                icon: Icon(Icons.settings),
                color: ColorPalette.primary,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            child: Text(
                              '削除',
                              style: TextStyle(color: ColorPalette.alertRed),
                            ),
                            onPressed: () async {
                              Navigator.of(context).pop();

                              final err = await invoiceAction.delete(invoice);
                              if (err != null) {
                                AppDialog().showErrorAlert(context, err);
                                return;
                              }

                              isDeleted.value = true;
                            },
                          ),
                        ],
                        cancelButton: CupertinoButton(
                          child: Text('キャンセル'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      );
                    },
                  );
                }))
      ]).build(context),
      body: content,
    );
  }
}
