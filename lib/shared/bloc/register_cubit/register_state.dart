part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}


class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccess(this.registerModel);
}


class RegisterErorr extends RegisterState {
  final String regErorr;

  RegisterErorr(this.regErorr);
}

class authStateChanges extends RegisterState{}
class authStateNotChanges extends RegisterState{}
