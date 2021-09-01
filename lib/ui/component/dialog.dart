import 'package:flutter/material.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/component/button.dart';
import 'package:works_flutter/ui/font.dart';

class AppDialog {
  static final AppDialog _singleton = AppDialog._internal();

  factory AppDialog() {
    return _singleton;
  }

  AppDialog._internal();

  bool _isShown = false;

  void showErrorAlert(BuildContext context, dynamic e) {
    if (_isShown) {
      return;
    }

    _isShown = true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.toString(),
              style: TextStyle(
                color: ColorPalette.text,
                fontSize: 16,
                fontWeight: Font.normalWeight,
              )),
          actions: <Widget>[
            Container(
              child: GhostButton(
                  text: "閉じる",
                  color: ColorPalette.primary,
                  onClick: () {
                    Navigator.pop(context);
                  }),
              width: 80,
              height: 42,
            ),
          ],
        );
      },
    ).then((res) async {
      _isShown = false;
    });
  }

  void showSimpleMessage(BuildContext context, String message) {
    if (_isShown) {
      return;
    }

    _isShown = true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message,
              style: TextStyle(
                color: ColorPalette.text,
                fontSize: 16,
                fontWeight: Font.normalWeight,
              )),
          actions: <Widget>[
            Container(
              child: GhostButton(
                  text: "閉じる",
                  color: ColorPalette.primary,
                  onClick: () {
                    Navigator.pop(context);
                  }),
              width: 80,
              height: 42,
            ),
          ],
        );
      },
    ).then((res) async {
      _isShown = false;
    });
  }

  void showAlert(BuildContext context, String title, String message, Function callback) {
    if (_isShown) {
      return;
    }

    _isShown = true;

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(title,
                        style: TextStyle(
                          fontWeight: Font.boldWeight,
                          color: ColorPalette.text,
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        iconSize: 24,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: ColorPalette.border,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: ColorPalette.border,
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Text(message,
                  style: TextStyle(
                    fontWeight: Font.normalWeight,
                    color: ColorPalette.text,
                    fontSize: 16,
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: GhostButton(
                        text: "閉じる",
                        color: ColorPalette.primary,
                        onClick: () {
                          Navigator.pop(context);
                        }),
                    width: 80,
                    height: 42,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ).then((res) {
      _isShown = false;
    });
  }

  void showCustomDialog(BuildContext context, String title, Widget body, Function callback) {
    if (_isShown) {
      return;
    }

    _isShown = true;

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(title,
                        style: TextStyle(
                          fontWeight: Font.boldWeight,
                          color: ColorPalette.text,
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        iconSize: 24,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: ColorPalette.border,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: ColorPalette.border,
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: body,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: GhostButton(
                        text: "閉じる",
                        color: ColorPalette.primary,
                        onClick: () {
                          Navigator.pop(context);
                        }),
                    width: 80,
                    height: 42,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ).then((res) {
      _isShown = false;
    });
  }
}
