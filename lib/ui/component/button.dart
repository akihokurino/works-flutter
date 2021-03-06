import 'package:flutter/material.dart';
import 'package:works_flutter/ui/color.dart';

class ContainedButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final VoidCallback onClick;
  final VoidCallback? onLongPressed;

  ContainedButton({
    required this.text,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 16,
    required this.backgroundColor,
    required this.textColor,
    this.width = double.infinity,
    this.height = 48,
    required this.onClick,
    this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        child: Text(text, style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize)),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        onPressed: onClick,
        onLongPress: onLongPressed,
      ),
    );
  }
}

class ReversedButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onClick;

  ReversedButton(
      {required this.text,
      this.fontWeight = FontWeight.w700,
      this.fontSize = 16,
      required this.color,
      this.width = double.infinity,
      this.height = 48,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        splashColor: color.withAlpha(20),
        child: Text(text, style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize)),
        color: ColorPalette.itemBackground,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onClick;

  GhostButton(
      {required this.text,
      this.fontWeight = FontWeight.w700,
      this.fontSize = 16,
      required this.color,
      this.width = double.infinity,
      this.height = 48,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(text, style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize)),
        color: Colors.transparent,
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}
