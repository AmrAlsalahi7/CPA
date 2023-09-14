
import 'package:cp/layout/BottomNavBar.dart';
import 'package:cp/network/local/cachhelper.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:cp/screens/onboarding/onboarding.dart';
import 'package:cp/shared/bloc/auth_otp_cubit/otpcubit_cubit.dart';
import 'package:cp/shared/bloc/compensation_cubit/compensation_cubit.dart';
import 'package:cp/shared/bloc/complain_cubit/complain_cubit.dart';
import 'package:cp/shared/bloc/cpa_cubit/cpacubit.dart';
import 'package:cp/shared/bloc/login_cubit/users_cubit.dart';
import 'package:cp/shared/bloc/register_cubit/register_cubit.dart';
import 'package:cp/shared/bloc/theme_cubit/cpatheme_cubit.dart';
import 'package:cp/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/auth_phone/otp_screen.dart';
// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  await DioHelper.init();
  await CacheHelper.init();
  Widget widget;

  late var token = CacheHelper.getBoolean(key: 'id');
  print(token);
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? onBoarding = CacheHelper.getBoolean(key: 'onBoarding');

  if (onBoarding != null) {

      widget = CPALayout();

  }
  else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
    dioHelper: DioHelper(),
  ));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;
  final bool? isDark;
  final DioHelper dioHelper;
  MyApp({required this.startWidget, required this.dioHelper, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => UsersCubit(),
        ),
        BlocProvider(
          create: (context) => CPACubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ComplainCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => OtpcubitCubit(),
        ),
        BlocProvider(
          create: (context) => CompensationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
          CpathemeCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<CpathemeCubit, CpathemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ligthTheme,
                darkTheme: dartTheme,
                themeMode: CpathemeCubit.get(context).isDark
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: startWidget,
              );
            },
          );
        },
      ),
    );
  }
}
