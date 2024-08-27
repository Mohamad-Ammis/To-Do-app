import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.cursorColor,
    this.label,
    this.labelStyle,
    required this.filled,
    this.fillColor,
    required this.focusedBorderColor,
    required this.enabledBorderColor,
    this.suffixIcon,
    this.isEmail,
    this.isUserName,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.maxLines, this.initialValue,
  });
  final TextStyle textStyle;
  final Color cursorColor;
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isEmail;
  final bool? isUserName;
  final int? maxLines;
  final String? initialValue;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'required field';
        } else {
          return null;
        }
      },
      initialValue: initialValue,
      maxLines: maxLines,
      cursorColor: cursorColor,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label: label != null ? Text(label!) : null,
        labelStyle: labelStyle,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor, width: 0.12),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 0.30),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.12),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.12),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: suffixIcon,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: prefixIcon,
        ),
      ),
    );
  }
}
