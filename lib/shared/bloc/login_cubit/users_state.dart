part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UserStatesSuccess extends UsersState {
  final UsersModel usersModel;

  UserStatesSuccess({required this.usersModel});
}

class LoginLoading extends UsersState {}

class TokenState extends UsersState {}


class LoginErorr extends UsersState {

}
class LoginLoadUser extends UsersState {
  final UsersModel users;

  LoginLoadUser(this.users);
}

class LoginErorrForm extends UsersState {}