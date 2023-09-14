part of 'suggestion_cubit.dart';

@immutable
abstract class SuggestionState {}

class SuggestionInitial extends SuggestionState {}

class SuggestionSuccess extends SuggestionState {}

class SuggestionErorr extends SuggestionState {}
