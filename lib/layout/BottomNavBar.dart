import 'package:cp/shared/bloc/cpa_cubit/cpacubit.dart';
import 'package:cp/shared/bloc/cpa_cubit/statecpa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CPALayout extends StatelessWidget {
  const CPALayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CPACubit, CPAStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CPACubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important_rounded),
                  label: 'الأشعارات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'الاعدادات'),
            ],
          ),
        );
      },
    );
  }
}
