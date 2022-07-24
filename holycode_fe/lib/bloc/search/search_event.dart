part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchUser extends SearchEvent {
  final String userText;

  SearchUser(this.userText);
}

class GetUserInfo extends SearchEvent {
  final String username;

  GetUserInfo(this.username);
}