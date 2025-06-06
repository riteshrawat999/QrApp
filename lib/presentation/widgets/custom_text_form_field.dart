import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextField(
  TextEditingController controller,
  BuildContext context,
  String hintText,
  String labelText,
  TextInputType textInputType,
  Widget icon, {
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  bool autoValidate = false,
}) {
  final double screenWidth = MediaQuery.of(context).size.width;
  return TextFormField(
    controller: controller,
    keyboardType: textInputType,
    inputFormatters: inputFormatters ?? [],
    validator: validator,
    autovalidateMode:
        autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
    decoration: InputDecoration(
      prefixIcon: icon,
      hintText: hintText,
      labelText: labelText,
      hintMaxLines: 1,

      floatingLabelBehavior: FloatingLabelBehavior.values.first,
      labelStyle: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: screenWidth * 0.045,
      ),
      border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
