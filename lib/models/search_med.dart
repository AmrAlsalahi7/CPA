class SearchMedModel {
  bool? status;
  String? message;
  List<DataMed>? data;

  SearchMedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataMed>[];
      json['data'].forEach((v) {
        data!.add( DataMed.fromJson(v));
      });
    }
  }
}

class DataMed {
  int? id;
  String? medName;
  String? scienName;
  String? price;
  String? price_sell;
  String? contraindication;
  String? sideEffict;
  String? dosage;
  String? strength;
  String? type;
  String? dateS;
  String? dateE;
  String? country;
  int? permit;



  DataMed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medName = json['med_name'];
    scienName = json['scien_name'];
    price = json['price_p'];
    price_sell = json['price_sell'];
    contraindication = json['contraindication'];
    sideEffict = json['side_effict'];
    dosage = json['dosage'];
    strength = json['strength'];
    type = json['type'];
    dateS = json['date_s'];
    dateE = json['date_e'];
    country = json['country'];
    permit = json['permit'];
  }

}