import 'package:bloc/bloc.dart';
import 'package:cp/network/end_point.dart';
import 'package:cp/network/remot/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/foodstuff_search.dart';

part 'food_stuff_state.dart';

class FoodStuffCubit extends Cubit<FoodStuffState> {
  FoodStuffCubit() : super(FoodStuffInitial());
  static FoodStuffCubit get(context) => BlocProvider.of(context);

   FoodStuffModel? foodStuffModel;

  void searchFoodStuff({String? food_name}) {
    emit(SearchFoodLoadingState());
    DioHelper.postData(url:SearchFoodV,data: {'food_name':food_name}).then((value){

      foodStuffModel=FoodStuffModel.fromJson(value.data);
      emit(SearchFoodSuccessState());
    }).catchError((erorr){
      emit(SearchFoodErorrState());
    });
  }
}
