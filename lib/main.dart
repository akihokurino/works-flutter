import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/login/login.dart';
import 'package:works_flutter/ui/root/root.dart';

final RouteObserver routeObserver = new RouteObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final GlobalKey<NavigatorState> globalKey = new GlobalKey<NavigatorState>();

  final theme = ThemeData(
      primaryColor: ColorPalette.primary,
      scaffoldBackgroundColor: ColorPalette.background,
      splashColor: ColorPalette.primaryBackground,
      highlightColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      ));

  final isLogin = FirebaseAuth.instance.currentUser != null;
  final home = isLogin ? RootPage.init() : LoginPage.init();

  final app = MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme,
    home: home,
    builder: (context, child) {
      // 端末の文字サイズ設定を無効にする
      return MediaQuery(
        child: child!,
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      );
    },
    navigatorObservers: [routeObserver],
    navigatorKey: globalKey,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() async {
    runApp(ProviderScope(
      child: app,
    ));
  }, (e, s) async => await FirebaseCrashlytics.instance.recordError(e, s));
}
