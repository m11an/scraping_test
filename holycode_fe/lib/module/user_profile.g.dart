// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      postCount: json['post_count'] as String?,
      followers: json['followers'] as String?,
      following: json['following'] as String?,
    )..listOfImages = (json['list_urls_for_images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'post_count': instance.postCount,
      'followers': instance.followers,
      'following': instance.following,
      'list_urls_for_images': instance.listOfImages,
    };
