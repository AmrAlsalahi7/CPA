class UsersModel {
  bool? loginStatus;
  String? message;
  UserData? data;

  UsersModel.fromJson(Map<String, dynamic> json) {
    loginStatus = json['status']??"";
    message = json['message']??"";
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? password;
  // String token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    password = json['password'];
    // token = json['token'];

  }
}
