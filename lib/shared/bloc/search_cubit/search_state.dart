part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchMedLoadedState extends SearchState{}

class SearchMedSuccessState extends SearchState{}


class SearchMedLoadingState extends SearchState{}

class SearchMedErorrState extends SearchState{}