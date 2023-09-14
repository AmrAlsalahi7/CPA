import 'package:cp/network/end_point.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<List<dynamic>> getData(
      {String? url,Map<String,dynamic>? query}) async {
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };
      Response response = await dio!.get(url!,queryParameters: query);
     return response.data;

      //print(response.data);
      //return await dio.get(url);
    } on DioError catch (e) {
     // print(e);
       return [];
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
}) async {
    dio!.options.headers = {
      'Access-Control-Allow-Origin': '*',
      'accept':'application/json',
      'Content-Type': 'application/json',

    };
     return  dio!.post(url,data:data);
  }



  static Future<Response> getDataUser({
    required String url,
    Map<String,dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Access-Control-Allow-Origin': '*',
      'accept':'application/json',
      'Content-Type': 'application/json',

    };
    return  dio!.get(url,queryParameters:query);
  }
}
