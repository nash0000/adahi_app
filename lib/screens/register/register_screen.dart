import 'package:adahi_app/layout/cubit/cubit.dart';
import 'package:adahi_app/screens/login/login_screen.dart';
import 'package:adahi_app/screens/register/cubit/cubit.dart';
import 'package:adahi_app/screens/register/cubit/states.dart';
import 'package:adahi_app/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fullNameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
      if (state is RegisterStateLoading) {
        buildProgress(
          context: context,
          text: 'please wait until creating an account ..',
        );
      }

      if (state is RegisterStateSuccess) {
        HomeCubit.get(context).changeIndex(0);

        navigateAndFinish(
          context,
          LoginScreen(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      }

      if (state is RegisterStateError) {
        Navigator.pop(context);

        buildProgress(
          context: context,
          text: 'this email is already used',
          error: true,
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Register',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultTextForm(
                  highlightElevation: 0,
                  elevation: 0,
                  controller: fullNameController,
                  type: TextInputType.name,
                  hint: 'enter full name',
                  title: 'full Name',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextForm(
                  highlightElevation: 0,
                  elevation: 0,
                  controller: phoneController,
                  type: TextInputType.phone,
                  hint: 'enter your phone',
                  title: 'phone number!',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextForm(
                  highlightElevation: 0,
                  elevation: 0,
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  hint: 'enter email',
                  title: 'Email',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextForm(
                  elevation: 0,
                  highlightElevation: 0,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                  hint: 'enter password',
                  title: 'Password',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultTextForm(
                  highlightElevation: 0,
                  elevation: 0,
                  controller: addressController,
                  type: TextInputType.text,
                  hint: 'enter city',
                  title: 'Address',
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  text: 'back',
                  function: () {
                    navigateTo(context, WelcomeScreen());
                  },
                  elevation: 0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultButton(
                    text: 'register',
                    elevation: 0.0,
                    function: () async {
                      var result = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);

                      if (result != null) {
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(result.user!.uid)
                            .set({
                          "email": emailController.text,
                          "address": addressController.text,
                          "phone": phoneController.text,
                          "fullName": fullNameController.text,
                        });
                      } else {
                        if (result == null) {
                          String fullName = fullNameController.text;
                          String phone = phoneController.text;
                          String email = emailController.text;
                          String password = passwordController.text;
                          String address = addressController.text;

                          if (fullName.isEmpty ||
                              phone.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              address.isEmpty) {
                            showToast(
                              text: 'please enter a valid data',
                              error: true,
                            );

                            //return;
                          }

                          //print(result);
                        }
                      }
                      navigateAndReplacement(
                          context,
                          LoginScreen(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                    }),
                //}
              ],
            ),
          ),
        ),
      );
    });
  }
}
