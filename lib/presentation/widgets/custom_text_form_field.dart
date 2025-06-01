import 'package:flutter/material.dart';

Widget customTextField(
  TextEditingController controller,
  BuildContext context,
  String hintText,
  String labelText,
  TextInputType textInputType,
  Widget icon,
) {
  final double screenWidth = MediaQuery.of(context).size.width;
  return TextField(
    controller: controller,
    keyboardType: textInputType,
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
