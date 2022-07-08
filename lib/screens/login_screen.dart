import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/components/default_button.dart';
import 'package:magdsoft_internship_task/data/remote/dio_helper.dart';
import 'package:magdsoft_internship_task/screens/user_screen.dart';
import 'package:magdsoft_internship_task/screens/register_screen.dart';
import '../components/default_textformfield.dart';
import '../constants/constants.dart';
import '../constants/end_points.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  // Validate the data entered from user in the form
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword=true ;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
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
                            validate: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                else if(!value.toString().contains('@') || !value.toString().contains('.') ) {
                                  return 'Please enter valid email';
                                }
                                return null;

                            },
                        ),


                        kDefaultFormField(
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: isPassword? Icons.visibility_off: Icons.visibility,
                          controller: passwordController,
                          isPassword: isPassword,
                          isSuffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          validate: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              else if(value.toString().length<8) {
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
                                onPressed: (){
                                  Navigator.pushNamed(context, RegistrationScreen.id);
                                },
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            kDefaultButton(
                                label: 'Login',
                                onPressed: (){
                                  if(_formKey.currentState!.validate() )
                                    {
                                      DioHelper.postData(
                                          method: LOGIN ,
                                          data:
                                          {
                                            'email': emailController.text,
                                            'password': passwordController.text,
                                          }
                                      ).then((value)
                                      {
                                        print(value.data);
                                      }).catchError((error)
                                      {
                                        print(error.toString());
                                      }
                                      );


                                      Navigator.pushNamed(context, UserScreen.id);
                                    }
                                },
                            ),

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
  }
}

