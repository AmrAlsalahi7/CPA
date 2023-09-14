part of 'complain_cubit.dart';

@immutable
abstract class ComplainState {}

class ComplainInitial extends ComplainState {}

class ComplainLoading extends ComplainState {}

class ComplainSuccess extends ComplainState {}


class ComplainErorr extends ComplainState {}

//ImagePicker State

class ComplainImageSuccessState extends ComplainState {}

class ComplainImageErorrState extends ComplainState {}

class ComplainImageRemoveState extends ComplainState {}

//show

class ComplainShowSuccessState extends ComplainState {
  final List<ComplainModel> complainModel;

  ComplainShowSuccessState(this.complainModel);

}

class ComplainShowErorrState extends ComplainState {}

class ComplainTokenRemoveState extends ComplainState {}
