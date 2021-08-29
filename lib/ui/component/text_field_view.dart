import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:works_flutter/ui/color.dart';

class TextFieldView extends StatefulWidget {
  final bool isSecure;
  final bool isFocus;
  final VoidCallback? onHintTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final String placeholder;
  final TextInputType inputType;
  final List<TextInputFormatter> formaters;

  TextFieldView(
      {this.isSecure = false,
      this.isFocus = false,
      this.onHintTap,
      this.onChange,
      this.onSubmit,
      this.placeholder = "",
      this.inputType = TextInputType.text,
      this.formaters = const []});

  @override
  State<StatefulWidget> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  bool _isOnSecureIcon = true;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

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
      height: 54,
      child: Stack(
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
