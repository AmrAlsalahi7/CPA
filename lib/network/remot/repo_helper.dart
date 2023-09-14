import 'package:cp/network/end_point.dart';

import '../../models/complainModel.dart';
import '../../models/notification_model.dart';
import '../../models/users.dart';
import 'dio_helper.dart';

class RepositoryHelper {
  final DioHelper dioHelper;

  RepositoryHelper(this.dioHelper);

  Future<List<UsersModel>> getAllUser(String idUser) async {
    final users = await dioHelper.getData(url:'${ShowUser}', query: {'id': idUser});
      return users.map((user) => UsersModel.fromJson(user)).toList();
  }

  Future<List<ComplainModel>> getAllComplains(int user_id) async {
    final com = await dioHelper.getData(url: ShowComplains,query:{});
    return com.map((com) => ComplainModel.fromJson(com)).toList();
  }

  Future<List<NotificationModel>> getLastNotification() async {
    final noti = await dioHelper.getData(url: DisplayNot);
    return noti.map((noti) => NotificationModel.fromJson(noti)).toList();
  }

  // Future<List<SearchMed>>showMedShow() async {
  //   final med = await dioHelper.getData(url: SearchMedV);
  //   return med.map((med) => SearchMed.fromJson(med)).toList();
  // }
  //
  //  Future<List<SearchMed>> searchMedRep(String med_name) async {
  //    final med = await dioHelper.getData(url: SearchMedV,query:{'med_name':med_name});
  //    return med.map((med) => SearchMed.fromJson(med)).toList();
  //  }

}
