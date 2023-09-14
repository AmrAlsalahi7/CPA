class NotificationModel {
  int? id;
  String? messages;
  String? dateTime;
  String? msgType;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messages = json['messages'];
    dateTime = json['date_time'];
    msgType = json['msg_type'];
  }
}
