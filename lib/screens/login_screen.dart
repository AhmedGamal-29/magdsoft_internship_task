import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_internship_task/components/default_button.dart';
import 'package:magdsoft_internship_task/cubit/app_states.dart';
import 'package:magdsoft_internship_task/cubit/cubit.dart';
import 'package:magdsoft_internship_task/screens/register_screen.dart';
import 'package:magdsoft_internship_task/screens/user_screen.dart';

import '../components/default_textformfield.dart';
import '../constants/constants.dart';

class LoginScreen extends StatelessWidget {
  // Validate the data entered from user in the form
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = AppCubit().isPassword;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {}
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kPrimaryColor,
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          kDefaultFormField(
                            label: 'Email',
                            keyboard: TextInputType.emailAddress,
                            prefix: Icons.email,
                            controller: emailController,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!value.toString().contains('@') ||
                                  !value.toString().contains('.')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          kDefaultFormField(
                            label: 'Password',
                            prefix: Icons.lock,
                            suffix: AppCubit().suffix,
                            controller: passwordController,
                            isPassword: isPassword,
                            isSuffixPressed: () {
                              AppCubit().changePasswordVisibility();
                            },
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.toString().length < 8) {
                                return 'Your password must be 8 characters or more';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              kDefaultButton(
                                label: 'Register',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen()),
                                  );
                                },
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              kDefaultButton(
                                  label: 'Login',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      AppCubit().login(
                                          email: emailController.text,
                                          password: passwordController.text);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserScreen()));
                                    }
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
