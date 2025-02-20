import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/style.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String placeholder;
  final bool isSecure;
  final bool isError;
  final TextEditingController controller;
  final FormFieldValidator? fieldValidator;
  final TextInputType inputType;
  final bool refresh;
  final Function? onTap;
  final String? suffixText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool border;
  final Function? onChanged;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool enablePadding;
  final bool isRounded;
  final EdgeInsets padding;
  final int maxLine;
  final Color backgroundColor;

  const CustomTextField({
    Key? key,
    this.placeholder = '',
    this.title,
    this.isSecure = false,
    this.isError = false,
    required this.controller,
    required this.fieldValidator,
    this.inputType = TextInputType.text,
    this.refresh = false,
    this.onTap,
    this.suffixText,
    this.border = false,
    this.onChanged,
    this.enabled = true,
    this.inputFormatters,
    this.enablePadding = false,
    this.isRounded = false,
    this.maxLine = 1,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    this.suffixWidget,
    this.prefixWidget,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  late OutlineInputBorder normalBorder;
  late OutlineInputBorder errorBorder;
  late OutlineInputBorder roundErrorBorder;
  late OutlineInputBorder roundBorder;

  @override
  void initState() {
    _passwordVisible = widget.isSecure;
    normalBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    );
    errorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
    roundBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    );
    roundErrorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title != null)
          Text(
            widget.title ?? "",
            style: formLabelStyle.copyWith(color: Colors.redAccent),
            maxLines: 1,
          ),
        const SizedBox(height: 4.0),
        TextFormField(
          maxLines: widget.maxLine,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          onTap: () {
            if (widget.refresh) {
              widget.onTap!();
            }
          },
          onChanged: (str) {
            if (widget.onChanged != null) widget.onChanged!();
          },
          obscureText: _passwordVisible,
          controller: widget.controller,
          keyboardType: widget.inputType,
          style: formTextFieldStyle,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            errorBorder: widget.isRounded ? roundErrorBorder : errorBorder,
            focusedErrorBorder: widget.isRounded ? roundErrorBorder : errorBorder,
            filled: true,
            fillColor: widget.isError ? Colors.white : widget.backgroundColor,
            contentPadding: widget.padding,
            prefixIcon: widget.prefixWidget != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: widget.prefixWidget,
                  )
                : null,
            suffixIcon: widget.isSecure
                ? Material(
                    color: Colors.transparent,
                    child: IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded)),
                  )
                : widget.suffixText != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.suffixText!,
                            textAlign: TextAlign.center,
                            style: formTextFieldStyle,
                          ),
                        ],
                      )
                    : widget.suffixWidget,
          ),
          validator: widget.fieldValidator,
        ),
      ],
    );
  }
}
