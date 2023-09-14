import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../models/compensation_model.dart';
import '../../../network/local/cachhelper.dart';

part 'compensation_state.dart';

class CompensationCubit extends Cubit<CompensationState> {
  CompensationCubit() : super(CompensationInitial());

  static CompensationCubit get(context) => BlocProvider.of(context);

  File? imagePath;
  String? imagename;
  String? imagedata;
  ImagePicker? imagePicker =  ImagePicker();

  Future<void> getImage() async {
    var pickedFile = await imagePicker!.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      imagename = pickedFile.path.split('/').last;
      imagedata = base64Encode(imagePath!.readAsBytesSync());
      emit(CompensationImageSuccessState());
      print(imagePath);
      print(imagename);
      print(imagedata);
    } else {
      print('No image selected !');
      emit(CompensationImageErorrState());
    }
  }

  void removeImage(){
    imagePath = null ;
    emit(CompensationImageRemoveState());
  }
  int? token = CacheHelper.getBoolean(key: 'id');

  CompensationModel? compensationModel;

  Future<void> uploadCompensation({
    String? pro_company,
    String? pro_type,
    String? com_type,
    String? reason_com,
    String? amount_com,
  }) async {
    emit(CompensationLoading());
    DioHelper.postData(url: AddCompensation, data: {
      "pro_company": pro_company,
      "pro_type": pro_type,
      "com_type": com_type,
      "reason_com": reason_com,
      "amount_com": amount_com,
      "user_id": token ?? "",
      "data": imagedata,
      "name": imagename ?? "",
    }).then((value) {
      //var response = value.data;
      compensationModel = CompensationModel.fromJson(value.data);
      emit(CompensationSuccess());
      print(value.data);
    });
  }
}
