import 'package:flutter/material.dart';
import 'package:fyp_one/frontend/utlis/theme/colors.dart';

Widget getTextFeild(Size s, String key, TextEditingController controller,
    String? Function(String?)? validator) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white70,
        )),
    height: 50,
    width: s.width * 0.6,
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: TextFormField(
          obscureText: key == "password" ? true : false,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70),
            prefixIcon: Icon(
                key == "Roll Number"
                    ? Icons.account_box_rounded
                    : key == "password"
                        ? Icons.password_rounded
                        : Icons.account_box,
                color: Colors.white70),
            enabledBorder: InputBorder.none,
            hintText: key == "Roll Number" ? "roll no." : "password",
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
        ),
      ),
    ),
  );
}
