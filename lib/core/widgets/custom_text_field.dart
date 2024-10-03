import 'package:flutter/material.dart';
import 'package:make_qr/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool autofocus;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      this.keyboardType,
      this.onChanged,
      this.autofocus = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        autofocus: autofocus,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: appGrey,
          ),
          enabledBorder: customInputBorder(),
          focusedBorder: customInputBorder(),
          errorBorder: customInputBorder(color: Colors.red),
          focusedErrorBorder: customInputBorder(color: Colors.red),
        ));
  }

  InputBorder customInputBorder({Color color = primaryColor}) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
