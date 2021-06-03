import 'package:adahi_app/screens/welcome_screen.dart';

import 'package:adahi_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          buildSettingItem(
            function: () {},
            title: 'Account Settings',
          ),
          buildSettingItem(
            function: () {},

            //{
            // navigateTo(context,PhoneScreen(),);
            //},
            title: 'Phone Authentication',
          ),
          buildSettingItem(
            function: () {},
            title: 'Push Notifications',
          ),
          buildSettingItem(
            function: () {},
            title: 'About us',
          ),
          buildSettingItem(
            function: () {},
            title: 'Contact us',
          ),
          Container(
            child: buildSettingItem(
              function: () async {
                await FirebaseAuth.instance.signOut();
                navigateAndFinish(context, WelcomeScreen());
              },
              title: 'Logout',
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.teal,
                width: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
