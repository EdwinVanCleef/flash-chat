// ignore_for_file: prefer_const_constructors

import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields(
      {Key? key,
      required this.onChangedEvent,
      required this.hintText,
      required this.buttonColor})
      : super(key: key);

  final Function onChangedEvent;
  final String hintText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChangedEvent();
      },
      decoration: kInputDecoration.copyWith(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: buttonColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: buttonColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
