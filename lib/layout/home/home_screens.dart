import 'package:adahi_app/layout/cubit/cubit.dart';
import 'package:adahi_app/layout/cubit/states.dart';
import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:outline_material_icons/outline_material_icons.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var currentIndex = HomeCubit.get(context).currentIndex;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              HomeCubit.get(context).titles[currentIndex],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: HomeCubit.get(context).widget[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  25.0,
                ),
                topRight: Radius.circular(
                  25.0,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 15,
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.swift),
                  label: 'Butcher',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.personEnteringBooth),
                  label: 'profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.school),
                  label: 'setting',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
              selectedItemColor: defaultColor,
              currentIndex: currentIndex,
            ),
          ),
        );
      },
    );
  }
}
