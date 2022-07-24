// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../network/repository/insta_repository.dart';
import '../../module/user_profile.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      InstaRepository instaRepository = InstaRepository();
      if (event is SearchUser) {
        emit(Loading());
        if (event.userText.isNotEmpty) {
          emit(SearchLoaded());
        } else {
          emit(SearchLoaded(errorMsg: 'You didn\'t enter text'));
        }
      } else if (event is GetUserInfo) {
        emit(Loading());
        if (event.username.isEmpty) {
          emit(UserInfoLoaded(errorMsg: 'You didn\'t enter username'));
          return;
        }
        UserProfile? userProfile =
            await instaRepository.getUserProfile(event.username);
        if (userProfile != null) {
          userProfile.username = event.username;
          if (userProfile.listOfImages != null &&
              userProfile.listOfImages!.isNotEmpty) {
            userProfile.profileUrl = userProfile.listOfImages![0];
            userProfile.listOfImages!.removeAt(0);
          }
        }
        emit(UserInfoLoaded(userProfile: userProfile));
      }
    });
  }
}
