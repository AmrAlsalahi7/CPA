import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/search_med.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  static SearchCubit get(context) => BlocProvider.of(context);

  SearchMedModel? searchModel;

  void searchMedM({String? med_name}) {
    emit(SearchMedLoadingState());
    DioHelper.postData(url:SearchMedV,data: {'med_name':med_name}).then((value){

      searchModel=SearchMedModel.fromJson(value.data);
      emit(SearchMedSuccessState());
    }).catchError((erorr){
      emit(SearchMedErorrState());
    });
  }

}
