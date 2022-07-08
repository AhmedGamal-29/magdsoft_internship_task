import 'package:flutter/material.dart';
import 'package:magdsoft_internship_task/components/default_button.dart';
import 'package:magdsoft_internship_task/constants/constants.dart';
import 'package:magdsoft_internship_task/screens/login_screen.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'user_screen';

  UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  //Variables to get the real data with api and used it in the screen
  var name = 'Ahmed';
  var email = 'Ahmed@email.com';
  var phone = '0123456789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USER Data',
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                'Name : $name ',
                style: const TextStyle(
                  fontSize: 25.0,
                color: kPrimaryColor,
           ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Email : $email',
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: kPrimaryColor
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Phone : $phone',
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: kPrimaryColor
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              Center(
                child: kDefaultButton(
                  backgroundColor: Color(0xFFAD002F),
                    label: 'Logout',
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);

                    },

                ),
              ),

            ],
          ),
        );
  }
}
