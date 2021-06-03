import 'package:adahi_app/screens/register/register_screen.dart';
import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:adahi_app/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1420706/pexels-photo-1420706.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
              //'https://images.pexels.com/photos/2538412/pexels-photo-2538412.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
            ),
            SizedBox(
              height: 70.0,
            ),
            defaultButton(
              elevation: 0,
              text: 'login',
              function: () {
                navigateTo(
                    context,
                    LoginScreen(
                      email: 'email',
                      password: 'password',
                    ));
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: defaultButton(
                text: 'register',
                function: () {
                  navigateTo(context, RegisterScreen());
                },
                elevation: 0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            captionText('or login with ? '),
          ],
        ),
      ),
    );
  }
}
