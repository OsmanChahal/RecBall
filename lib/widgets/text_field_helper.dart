import 'package:flutter/material.dart';

Widget buildTextField({
  TextEditingController? controller,
  String? labelText,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  bool readOnly = false,
  VoidCallback? onTap,
  Widget? suffixIcon,
  String? initialValue
}){
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    readOnly: readOnly,
    onTap: onTap,
    decoration: InputDecoration(
      labelText: labelText,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),
    );
}