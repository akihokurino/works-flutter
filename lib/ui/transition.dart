import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Transition {
  static final Transition _singleton = Transition._internal();

  factory Transition() {
    return _singleton;
  }

  Transition._internal();

  GlobalKey<NavigatorState>? _globalKey;

  setup(GlobalKey<NavigatorState> globalKey) {
    _globalKey = globalKey;
  }

  void root(Widget to) async {
    final currentContext = _globalKey?.currentContext;
    if (currentContext == null) {
      return;
    }

    Navigator.of(currentContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => to, settings: RouteSettings(name: to.toStringShort())),
      ModalRoute.withName('/'),
    );
  }

  void pushWithTab(BuildContext context, Widget to) {
    pushNewScreenWithRouteSettings(context, settings: RouteSettings(name: to.toStringShort()), screen: to, withNavBar: true);
  }

  void pushWithoutTab(BuildContext context, Widget to) {
    pushNewScreenWithRouteSettings(context, settings: RouteSettings(name: to.toStringShort()), screen: to, withNavBar: false);
  }

  Future<T?> modal<T>(BuildContext context, ModalRoute<T> to) {
    return pushDynamicScreen<T>(context, screen: to, withNavBar: false);
  }
}
