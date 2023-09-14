part of 'otpcubit_cubit.dart';

@immutable
abstract class OtpcubitState {}

class OtpcubitInitial extends OtpcubitState {}
class loading extends OtpcubitState {}
class ErrorOccurred extends OtpcubitState
{
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}
class PhoneNumSub extends OtpcubitState{}
class PhoneOtpVerify extends OtpcubitState{}
