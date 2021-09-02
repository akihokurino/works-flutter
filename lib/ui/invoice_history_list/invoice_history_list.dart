import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/invoice_history_list/provider.dart';

class InvoiceHistoryListPage extends HookWidget {
  final GlobalKey<NavigatorState> globalKey;

  static Widget init(GlobalKey<NavigatorState> globalKey) {
    return InvoiceHistoryListPage(globalKey: globalKey);
  }

  InvoiceHistoryListPage({required this.globalKey});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(invoiceHistoryListProvider);
    useEffect(() {}, const []);

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: _buildContent(),
        inAsyncCall: state.shouldShowHud);

    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "履歴").build(context),
      body: content,
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    );
  }
}
