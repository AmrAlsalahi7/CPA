import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../models/complainModel.dart';
import '../../../network/local/cachhelper.dart';

part 'complain_state.dart';

class ComplainCubit extends Cubit<ComplainState> {
  ComplainCubit() : super(ComplainInitial());

  static ComplainCubit get(context) => BlocProvider.of(context);

  //package of fetching image from phone
  File? imagePath;
  String? imagename;
  String? imagedata;
  ImagePicker imagePicker =  ImagePicker();

  Future<void> getImage() async {
    var pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      imagename = pickedFile.path.split('/').last;
      imagedata = base64Encode(imagePath!.readAsBytesSync());
      emit(ComplainImageSuccessState());
      // print(imagePath);
      // print(imagename);
      // print(imagedata);
    } else {
      print('No image selected !');
      emit(ComplainImageErorrState());
    }
  }

  void removeImage(){
    imagePath =null  ;
    emit(ComplainImageRemoveState());
  }
   late int token = CacheHelper.getBoolean(key: 'id');

  ComplainModel? complainModel;

  Future<void> uploadComplain({
    String? txtcom,
    String? proname,
    String? supcom,
    String? city,
    String? street,
  }) async {
    DioHelper.postData(url: AddComplains, data: {
      "text_com": txtcom,
      "pro_name": proname,
      "sup_company": supcom,
      "city": city,
      "street": street,
      "user_id": token,
      "data": imagedata,
      "name": imagename ?? "",
    }).then((value) {
      //var response = value.data;
      // complainModel = ComplainModel.fromJson(value.data);
      emit(ComplainSuccess());
      print(value.data);
    });
  }
}
