part of 'compensation_cubit.dart';

@immutable
abstract class CompensationState {}

class CompensationInitial extends CompensationState {}

class CompensationLoading extends CompensationState {}

class CompensationSuccess extends CompensationState {}


class CompensationErorr extends CompensationState {}

//ImagePicker State

class CompensationImageSuccessState extends CompensationState {}

class CompensationImageErorrState extends CompensationState {}

class CompensationImageRemoveState extends CompensationState {}

//show

class CompensationShowSuccessState extends CompensationState {
  final List<CompensationModel> compModel;

  CompensationShowSuccessState(this.compModel);

}