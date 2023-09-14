part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}


class NotificationLoadingState extends NotificationState{}

class NotificationSuccessState extends NotificationState{
   List<NotificationModel> notificationModel;

  NotificationSuccessState(this.notificationModel);

}

class NotificationErorrState extends NotificationState{}