import 'package:flutter/material.dart';
abstract class LoginStates {}

class LoginInitialState extends LoginStates
{}

class LoginLoadingState extends LoginStates
{}

class LoginErrorState extends LoginStates
{}

class LoginSuccessState extends LoginStates
{}
