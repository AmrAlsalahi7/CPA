import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void registerUser({
    String? name,
    String? address,
    String? pass,
    String? phone,
  }) {
    emit(RegisterLoading());
    DioHelper.postData(
      url: Register,
      data: {
        'name': name,
        'address': address,
        'phone': phone,
        'password': pass,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value.data);
      emit(RegisterSuccess(registerModel!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(RegisterErorr(erorr.toString()));
    });
  }
  void authStateChange()
  async{
    // await Firebase.initializeApp();
    FirebaseAuth.instance.authStateChanges().listen((user)
    {
      if(user==null)
      {
        emit(authStateNotChanges());
      }
      else
      {
        emit(authStateChanges());
      }
    });
  }
}
