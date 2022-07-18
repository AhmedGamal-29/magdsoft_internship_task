import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/cubit/app_states.dart';

import '../constants/end_points.dart';
import '../data/remote/dio_helper.dart';
import '../screens/login_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      method: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      method: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void signOut(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;
  bool isConfPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void changeConfPasswordVisibility() {
    isConfPassword = !isConfPassword;
    suffix = isConfPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
