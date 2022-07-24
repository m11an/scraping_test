import 'dart:js';

import 'package:chopper/chopper.dart';
import 'package:holycode_fe/module/user_profile.dart';
import 'package:holycode_fe/network/client_chopper.dart';

part 'insta_scraper_api.chopper.dart';

@ChopperApi()
abstract class InstaScraperApi extends ChopperService {
  static InstaScraperApi create() {
    final client = Client.getClient();
    return _$InstaScraperApi(client);
  }

  @Get(
    path: '/scrapingInsta',
  )
  Future<Response<UserProfile>> scrapingProfil(
    @Query('username') String username,
  );

  @Get(
    path: '/search',
  )
  Future<Response<JsArray>> searchUsers(
    @Query('username') String username,
  );
}
