import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(ignore: true)
  String? username;
  @JsonKey(name: 'post_count')
  String? postCount;
  String? followers;
  String? following;
  @JsonKey(ignore: true)
  String? profileUrl;
  @JsonKey(name: 'list_urls_for_images')
  List<String>? listOfImages;

  UserProfile({
    this.postCount,
    this.followers,
    this.following,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  static const fromJsonFactory = _$UserProfileFromJson;
}
