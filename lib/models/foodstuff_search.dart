class FoodStuffModel {
  bool? status;
  String? message;
  List<Data>? data;


  FoodStuffModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? foodName;
  String? type;
  String? foodAvailable;
  String? suppCompany;
  String? price;
  String? price_sell;
  String? dateS;
  String? dateE;
  String? country;
  int? permit;

  Data(
      {this.id,
        this.foodName,
        this.type,
        this.foodAvailable,
        this.suppCompany,
        this.price,
        this.dateS,
        this.dateE,
        this.country,
        this.permit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodName = json['food_name'];
    type = json['type'];
    foodAvailable = json['food_available'];
    suppCompany = json['supp_company'];
    price = json['price'];
    price = json['price_sell'];
    dateS = json['date_s'];
    dateE = json['date_e'];
    country = json['country'];
    permit = json['permit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['food_name'] = this.foodName;
    data['type'] = this.type;
    data['food_available'] = this.foodAvailable;
    data['supp_company'] = this.suppCompany;
    data['price'] = this.price;
    data['date_s'] = this.dateS;
    data['date_e'] = this.dateE;
    data['country'] = this.country;
    data['permit'] = this.permit;
    return data;
  }
}