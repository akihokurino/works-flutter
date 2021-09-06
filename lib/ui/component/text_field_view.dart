import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:works_flutter/ui/color.dart';
import 'package:works_flutter/ui/font.dart';

class TextFieldView extends StatefulWidget {
  final bool isSecure;
  final bool isFocus;
  final VoidCallback? onHintTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final String label;
  final String placeholder;
  final String value;
  final TextInputType inputType;
  final List<TextInputFormatter> formaters;

  TextFieldView(
      {this.isSecure = false,
      this.isFocus = false,
      this.onHintTap,
      this.onChange,
      this.onSubmit,
      this.label = "",
      this.placeholder = "",
      this.value = "",
      this.inputType = TextInputType.text,
      this.formaters = const []});

  @override
  State<StatefulWidget> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  bool _isOnSecureIcon = true;
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.value);

    _controller.addListener(() {
      final val = _controller.text;

      if (widget.onChange != null) {
        widget.onChange!(val);
      }
    });

    if (widget.isFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

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
          Stack(
            children: [
              TextField(
                inputFormatters: widget.formaters,
                focusNode: _focusNode,
                onSubmitted: widget.onSubmit,
                controller: _controller,
                obscureText: widget.isSecure && _isOnSecureIcon,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                    hintText: widget.placeholder,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.primary,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _buildRightIcon(),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRightIcon() {
    if (widget.isSecure) {
      return Container(
        margin: EdgeInsets.only(right: 12),
        child: InkWell(
          child: Icon(_isOnSecureIcon ? Icons.visibility_off : Icons.visibility, size: 24, color: ColorPalette.secureIcon),
          onTap: () {
            setState(() {
              _isOnSecureIcon = !_isOnSecureIcon;
            });
          },
        ),
      );
    }
    if (widget.onHintTap != null) {
      return Container(
        margin: EdgeInsets.only(right: 12),
        child: InkWell(
          child: Icon(Icons.help, size: 24, color: ColorPalette.secureIcon),
          onTap: widget.onHintTap,
        ),
      );
    } else {
      return Container();
    }
  }
}
