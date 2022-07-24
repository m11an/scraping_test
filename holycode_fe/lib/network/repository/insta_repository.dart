import 'package:holycode_fe/module/user_profile.dart';
import 'package:holycode_fe/network/client_chopper.dart';
import 'package:holycode_fe/network/insta_scraper_api.dart';

class InstaRepository {
  Future<UserProfile?> getUserProfile(String username) async {
    InstaScraperApi scraperApi = InstaScraperApi.create();
    UserProfile? userProfile;
    await scraperApi.scrapingProfil(username).then((value) {
      userProfile = value.body;
    }).onError((error, stackTrace) {
      print('error');
    });
    return userProfile;
  }
}
