import 'package:holycode_fe/module/user_profile.dart';

import '../../network/helper/exceptions.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonTypeParser {
  static const Map<Type, JsonFactory> factories = {
   UserProfile: UserProfile.fromJsonFactory,
  };

  static dynamic decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  static T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw JsonFactoryNotFoundException(T.toString());
    }

    return jsonFactory(values);
  }

  static List<T>? _decodeList<T>(Iterable values) {
    if (values.isEmpty) {
      return [];
    }
    List<T> listOfT = [];
    List<dynamic> list = values.toList();
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null) {
        var d = decode<T>(list[i]);
        listOfT.add(d);
      }
    }
    return listOfT;
  }
}
