part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final String? errorMsg;

  SearchLoaded({this.errorMsg = ""});
}

class UserInfoLoaded extends SearchState {
  final UserProfile? userProfile;
  final String? errorMsg;

  UserInfoLoaded({this.userProfile, this.errorMsg = ""});
}

class Loading extends SearchState {}
