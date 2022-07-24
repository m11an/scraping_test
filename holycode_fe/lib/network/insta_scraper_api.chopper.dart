// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insta_scraper_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$InstaScraperApi extends InstaScraperApi {
  _$InstaScraperApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = InstaScraperApi;

  @override
  Future<Response<UserProfile>> scrapingProfil(String username) {
    final $url = '/scrapingInsta';
    final $params = <String, dynamic>{'username': username};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<UserProfile, UserProfile>($request);
  }
}
