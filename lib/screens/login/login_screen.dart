//import 'package:adahi_app/layout/home/home_screens.dart';
//import 'package:adahi_app/screens/login/cubit/cubit.dart';
//import 'package:adahi_app/screens/login/cubit/states.dart';
import 'package:adahi_app/screens/mainpage/mainpage.dart';
//import 'package:adahi_app/screens/register/register_screen.dart';
import 'package:adahi_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  String email;
  String password;

  LoginScreen({required this.email, required this.password});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.0,
              ),
              defaultTextForm(
                controller: emailController,
                type: TextInputType.emailAddress,
                elevation: 10.0,
                highlightElevation: 6.0,
                hint: 'enter email',
                title: 'Email',
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultTextForm(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                elevation: 10.0,
                highlightElevation: 6.0,
                hint: 'enter password',
                isPassword: true,
                title: 'Password',
              ),
              SizedBox(
                height: 100.0,
              ),
              defaultButton(
                elevation: 10.0,
                function: () async {
                  var result = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                  if (result != null) {
                    // print('welcome');
                    navigateTo(context, FirstPage());
                  } else {
                    print('user not found');
                  }
                },
                text: 'login',
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  print('forgot password');
                },
                child: captionText('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
