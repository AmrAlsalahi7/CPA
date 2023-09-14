// import 'package:bloc/bloc.dart';

// import 'package:cpa_project/network/local/cachhelper.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/users.dart';
// import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of(context);

  final List<String> errors = [];

  void addErorr({String? error}) {
    if (!errors.contains(error)) errors.add(error!);
    emit(LoginErorrForm());
  }

  void removeError({String? error}) {
    if (errors.contains(error)) errors.remove(error);
    emit(LoginErorrForm());
  }

  UsersModel? usersModel;

  void loginIn({required String? phone, required String? passwords}) {
    emit(LoginLoading());
    DioHelper.postData(
        url: LoginUser,
        data: {'phone': phone, 'password': passwords}).then((value) {
          usersModel =UsersModel.fromJson(value.data);
      emit(UserStatesSuccess(usersModel: usersModel!));
       print(value);
    });
  }
}
