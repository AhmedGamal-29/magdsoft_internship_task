import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_internship_task/components/default_button.dart';
import 'package:magdsoft_internship_task/components/default_textformfield.dart';
import 'package:magdsoft_internship_task/constants/constants.dart';
import 'package:magdsoft_internship_task/cubit/cubit.dart';
import 'package:magdsoft_internship_task/screens/user_screen.dart';

import '../constants/constants.dart';
import '../cubit/app_states.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = AppCubit().isPassword;
  bool isConfPassword = AppCubit().isConfPassword;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
          if (state is RegisterSuccessState) {}
        }, builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kPrimaryColor,
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kDefaultFormField(
                              label: 'Full Name',
                              controller: nameController,
                              prefix: Icons.account_circle_rounded,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Name must not be Empty';
                                } else if (value.toString().length < 10) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            kDefaultFormField(
                              label: 'Email Address',
                              controller: emailController,
                              prefix: Icons.email,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.toString().contains('@') ||
                                    !value.toString().contains('.')) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              keyboard: TextInputType.emailAddress,
                            ),
                            kDefaultFormField(
                              label: 'Phone',
                              controller: phoneController,
                              prefix: Icons.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone must not be Empty';
                                } else if (value.toString().length < 11) {
                                  return 'Please enter valid phone number';
                                }
                                return null;
                              },
                              keyboard: TextInputType.phone,
                            ),
                            kDefaultFormField(
                              label: 'Password',
                              controller: passwordController,
                              prefix: Icons.lock,
                              suffix: isPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              // isSuffixPressed: () {
                              //   setState(() {
                              //     isPassword = !isPassword;
                              //   });
                              // },
                              isPassword: isPassword,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.toString().length < 8) {
                                  return 'Your password must be 8 characters or more';
                                }
                                return null;
                              },

                              keyboard: TextInputType.visiblePassword,
                            ),
                            kDefaultFormField(
                              label: 'Confirm Password',
                              controller: confirmPasswordController,
                              isPassword: isConfPassword,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password ';
                                } else if (value.toString() !=
                                    passwordController.text) {
                                  return "Password is not match";
                                }
                                return null;
                              },
                              keyboard: TextInputType.visiblePassword,
                              prefix: Icons.lock,
                              suffix: isConfPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              // isSuffixPressed: () {
                              //   setState(() {
                              //     isConfPassword = !isConfPassword;
                              //   });
                              // }
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                kDefaultButton(
                                    label: 'Register',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        AppCubit().register(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserScreen()),
                                        );
                                      }
                                    }),
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                                kDefaultButton(
                                  label: 'Login',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
