import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:works_flutter/provider/misoca.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/appbar.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/component/dialog.dart';

class MisocaPage extends HookWidget {
  static Widget init() {
    return MisocaPage();
  }

  MisocaPage();

  @override
  Widget build(BuildContext context) {
    final misocaState = useProvider(misocaProvider);
    final misocaAction = useContext().read(misocaProvider.notifier);

    final isWebViewLoading = useState(false);

    useEffect(() {
      return () {};
    }, const []);

    final webView = WebView(
      initialUrl:
          "https://app.misoca.jp/oauth2/authorize?client_id=jGKRHV2hW_t4kn0w4Ma1Jxo_XkZxUA37rqFPRiYT61k&redirect_uri=https://works-prod.web.app&response_type=code&scope=write",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {},
      navigationDelegate: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        isWebViewLoading.value = true;
      },
      onPageFinished: (String url) {
        isWebViewLoading.value = false;

        if (url.startsWith("https://works-prod.web.app")) {
          final _url = Uri.parse(url);
          final code = _url.queryParameters["code"];
          misocaAction.connect(code ?? "").then((err) {
            if (err != null) {
              AppDialog().showErrorAlert(context, err);
              return;
            }

            Navigator.of(context).pop();
          });
        }
      },
    );

    final content = ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary),
        ),
        child: webView,
        inAsyncCall: misocaState.shouldShowHud);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarFactory(title: "Misoca認証", actions: [
        Container(
            child: GhostButton(
          width: 100,
          text: "再接続",
          color: ColorPalette.primary,
          onClick: () async {
            final err = await misocaAction.refresh();
            if (err != null) {
              AppDialog().showErrorAlert(context, err);
              return;
            }

            Navigator.of(context).pop();
          },
        ))
      ]).build(context),
      body: content,
    );
  }
}
