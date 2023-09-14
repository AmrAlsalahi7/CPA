import 'package:bloc/bloc.dart';
import 'package:cp/network/remot/repo_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repositoryHelper) : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);


RepositoryHelper? repositoryHelper;
  List<NotificationModel>? notificationModel;


  List<NotificationModel>? getNotification(){
    repositoryHelper!.getLastNotification().then((value){
     this.notificationModel=value.cast<NotificationModel>();
      emit(NotificationSuccessState(notificationModel!));
    });
   // print(notificationModel.toString());
    return notificationModel;
  }
}
