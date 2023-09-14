
import '../../../models/users.dart';

abstract class CPAStates {}

class CPAInitialState extends CPAStates {}

class CPAChangeButtonNavState extends CPAStates {}

class ShowUserLoadedState extends CPAStates {
  List<UsersModel> users;

  ShowUserLoadedState(this.users);
}

class DisplaySuccess extends CPAStates {}
