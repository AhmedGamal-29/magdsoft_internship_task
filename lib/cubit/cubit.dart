import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

}