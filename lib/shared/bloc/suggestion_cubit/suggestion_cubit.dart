import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../network/local/cachhelper.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  SuggestionCubit() : super(SuggestionInitial());

  static SuggestionCubit get(context) => BlocProvider.of(context);

  int? token = CacheHelper.getBoolean(key: 'id');

  void suggAdd(
      {
        String? pro_sugg,
      String? reason_sugg,
      String? sugg_type,
      String? pro_company,
      String? other_det}) {
    DioHelper.postData(url: SuggAdd, data: {
      "pro_sugg": pro_sugg,
      "reason_sugg": reason_sugg,
      "sugg_type": sugg_type,
      "pro_company": pro_company,
      "other_det": other_det,
      "user_id": token
    }).then((value) {
      emit(SuggestionSuccess());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(SuggestionErorr());
    });
  }
}
