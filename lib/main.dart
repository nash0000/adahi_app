import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:adahi_app/screens/login/cubit/cubit.dart';
//import 'package:adahi_app/screens/login/cubit/states.dart';
//import 'package:adahi_app/screens/mainpage/navigationprovider.dart';
import 'package:adahi_app/screens/register/cubit/cubit.dart';
import 'package:adahi_app/shared/bloc_observer/bloc_observer.dart';
import 'package:flutter/material.dart';
//import 'package:adahi_app/screens/login/login_screen.dart';
import 'package:adahi_app/screens/welcome_screen.dart';
import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:provider/provider.dart';
import 'layout/cubit/cubit.dart';
//import 'layout/home/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static final String title = 'Navigation Drawer';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        title: ' Adahi_App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: defaultColor,
          ),
          primaryColor: defaultMaterialColor,
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
