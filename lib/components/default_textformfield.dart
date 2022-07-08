import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/constants/constants.dart';

Widget kDefaultFormField(
    {required TextEditingController controller,
      required FormFieldValidator validate,
      required String label,
      TextInputType? keyboard,
      IconData? prefix,
      bool isPassword = false,
      Color backgroundColor = Colors.white,
      Color fontColor = kPrimaryColor,
      IconData? suffix,
      VoidCallback? isSuffixPressed,
      bool isClickable = true}) =>
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: 300.0,
        child: TextFormField(
          validator: validate,
          controller: controller,
          keyboardType: keyboard,
          obscureText: isPassword,
          enabled: isClickable,
          decoration: InputDecoration(
              labelText: label,
              labelStyle:
              TextStyle(color: fontColor, backgroundColor: backgroundColor),
              prefixIcon: Icon(
                prefix,
                color: kPrimaryColor,
              ),
              suffixIcon: suffix != null
                  ? IconButton(
                onPressed: isSuffixPressed,
                icon: Icon(
                  suffix,
                  color: kPrimaryColor,
                ),
              )
                  : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(15.0)
                ),
              )),
        ),
      ),
    );