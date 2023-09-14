class CompensationModel {
  int? id;
  String? proCompany;
  String? proType;
  String? comType;
  String? reasonCom;
  String? amountCom;
  String? proPic;
  String? dateTime;
  int? userId;


  CompensationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proCompany = json['pro_company'];
    proType = json['pro_type'];
    comType = json['com_type'];
    reasonCom = json['reason_com'];
    amountCom = json['amount_com'];
    proPic = json['pro_pic'];
    dateTime = json['date_time'];
    userId = json['user_id'];
  }

}