import 'package:flutter/material.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String sub;
  final String value;
  final VoidCallback onClick;

  MenuItem({required this.text, this.sub = "", this.value = "", required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.border,
            width: 1,
          ),
        ),
      ),
      child: Material(
        color: ColorPalette.itemBackground,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(text,
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: Font.normalWeight,
                              fontSize: 18,
                            )),
                        margin: EdgeInsets.only(bottom: 2),
                      ),
                      _buildSubTextOrEmpty()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: _buildValueTextOrEmpty(),
                ),
                Icon(Icons.arrow_forward_ios, size: 15, color: ColorPalette.arrowIcon)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubTextOrEmpty() {
    if (sub.isNotEmpty) {
      return Text(sub,
          style: TextStyle(
            color: ColorPalette.textLight,
            fontWeight: Font.normalWeight,
            fontSize: 14,
          ));
    } else {
      return Container();
    }
  }

  Widget _buildValueTextOrEmpty() {
    if (value.isNotEmpty) {
      return Text(value,
          style: TextStyle(
            color: ColorPalette.textLight,
            fontWeight: Font.normalWeight,
            fontSize: 14,
          ));
    } else {
      return Container();
    }
  }
}
