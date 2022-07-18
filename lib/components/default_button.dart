import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/constants/constants.dart';

Widget kDefaultButton({
  double radius = 10,
  double elevation = 5,
  double width = 150.0,
  Color backgroundColor = kPrimaryColor,
  Color fontColor = Colors.white,
  required VoidCallback onPressed,
  required String label,
}) =>
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          elevation: elevation,
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: width,
            height: 40,
            child: Text(
              label,
              style: TextStyle(color: fontColor),
            ),
          ),
        ));
