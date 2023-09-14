part of 'food_stuff_cubit.dart';

@immutable
abstract class FoodStuffState {}

class FoodStuffInitial extends FoodStuffState {}

class SearchFoodLoadedState extends FoodStuffState{}

class SearchFoodSuccessState extends FoodStuffState{}


class SearchFoodLoadingState extends FoodStuffState{}

class SearchFoodErorrState extends FoodStuffState{}