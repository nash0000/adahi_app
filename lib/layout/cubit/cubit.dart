import 'package:adahi_app/layout/cubit/states.dart';

import 'package:adahi_app/screens/butcher/butcher_screen.dart';
import 'package:adahi_app/screens/profile/profile_screen.dart';
import 'package:adahi_app/screens/search/search_screen.dart';
import 'package:adahi_app/screens/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStateInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var widget = [
    ButcherScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  var titles = [
    'Butcher',
    'Search',
    'Profile',
    'Settings',
  ];

  int currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    emit(HomeStateIndex());
  }
}
