import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/data/remote/dio_helper.dart';
import 'package:magdsoft_internship_task/screens/user_screen.dart';
import 'package:magdsoft_internship_task/screens/register_screen.dart';
import 'package:magdsoft_internship_task/screens/login_screen.dart';


void main()
{
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // define routes to navigate between the screens
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => const LoginScreen(),
        UserScreen.id : (context) => UserScreen(),
        RegistrationScreen.id : (context) => const RegistrationScreen(),


      },
    );
  }
}