
import 'package:cp/screens/home/home_screen.dart';
import 'package:cp/screens/notificationscreen/notification_screen.dart';
import 'package:cp/screens/settings/settings.dart';
import 'package:cp/shared/bloc/cpa_cubit/statecpa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CPACubit extends Cubit<CPAStates> {
  CPACubit() : super(CPAInitialState());

  static CPACubit get(context) => BlocProvider.of(context);



  int currentIndex = 1;

  List<Widget> bottomScreen = [
    NotificationScreen(),
    HomeScreen(),
    SettingScreen()
  ];

  List<String> titles=[
    'الأشعارات',
    'الرئيسية',
    'الأعدادات'
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(CPAChangeButtonNavState());
  }





}