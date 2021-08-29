import 'package:flutter/material.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class AppBarFactory {
  final String title;
  final String subTitle;
  final bool isClose;
  final bool isDisableBack;
  final Color backgroundColor;
  final bool isFlat;
  final List<Widget> actions;
  final TabBar? tab;
  final VoidCallback? onBack;

  AppBarFactory(
      {required this.title,
      this.subTitle = "",
      this.isClose = false,
      this.isDisableBack = false,
      this.backgroundColor = Colors.white,
      this.isFlat = false,
      this.actions = const [],
      this.tab,
      this.onBack});

  AppBar build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      automaticallyImplyLeading: !isDisableBack,
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
      elevation: isFlat ? 0.0 : 1.0,
      leading: _buildLeftMenu(context),
      title: _buildTitle(),
      actions: actions,
      bottom: tab,
    );
  }

  Widget _buildTitle() {
    if (subTitle.isEmpty) {
      return Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorPalette.text, fontSize: 17, fontWeight: Font.boldWeight),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorPalette.text, fontSize: 17, fontWeight: Font.boldWeight),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: Font.normalWeight,
                  color: ColorPalette.text,
                )),
          )
        ],
      );
    }
  }

  Widget? _buildLeftMenu(BuildContext context) {
    if (!Navigator.of(context).canPop() || isDisableBack) {
      return null;
    }

    if (isClose) {
      return Container(
        child: IconButton(
          iconSize: 24,
          icon: Icon(Icons.close),
          onPressed: () {
            if (onBack != null) {
              onBack!();
              return;
            }
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      return Container(
        child: IconButton(
          iconSize: 24,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (onBack != null) {
              onBack!();
              return;
            }
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }
}
