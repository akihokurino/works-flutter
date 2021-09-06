import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class PickerFieldView extends StatefulWidget {
  final String label;
  final int index;
  final List<String> selection;
  final ValueChanged<int> onChange;

  PickerFieldView({this.label = "", this.index = 0, required this.selection, required this.onChange});

  @override
  State<StatefulWidget> createState() => _PickerFieldViewState();
}

class _PickerFieldViewState extends State<PickerFieldView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.index;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.itemBackground,
      width: double.infinity,
      height: widget.label.isNotEmpty ? 80 : 54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(widget.label,
                      style: TextStyle(
                        color: ColorPalette.textLight,
                        fontWeight: Font.normalWeight,
                        fontSize: 14,
                      )),
                )
              : Container(),
          InkWell(
            onTap: () {
              showAppPicker();
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.primary, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.selection[currentIndex],
                    style: TextStyle(
                      color: ColorPalette.text,
                      fontWeight: Font.normalWeight,
                      fontSize: 15,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showAppPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 250,
              color: Colors.white,
              child: Column(children: [
                Container(
                    color: Colors.white,
                    child: ListTile(
                      trailing: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            widget.onChange(currentIndex);
                            Navigator.of(context).pop();
                          },
                          child: Text("完了",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.primary,
                              )),
                        ),
                      ),
                    )),
                Container(child: Divider(height: 1.0, color: ColorPalette.border)),
                Container(
                  height: 150,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: currentIndex),
                    itemExtent: 50,
                    backgroundColor: CupertinoColors.white,
                    children: widget.selection.map((item) {
                      return Center(child: Text(item));
                    }).toList(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                      widget.onChange(index);
                    },
                  ),
                )
              ]));
        });
  }
}
