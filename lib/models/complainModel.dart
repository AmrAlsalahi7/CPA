class ComplainModel {
  int? id;
  String? textCom;
  String? proName;
  String? supCompany;
  String? city;
  String? street;
  String? proPic;
  String? dateTime;
  int? userId;

  ComplainModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    textCom = json['text_com'];
    proName = json['pro_name'];
    supCompany = json['sup_company'];
    city = json['city'];
    street = json['street'];
    proPic = json['sendimage'];
    dateTime = json['date_time'];
    userId = json['user_id'];
  }
}
