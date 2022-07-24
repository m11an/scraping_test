import 'package:chopper/chopper.dart';
import 'package:holycode_fe/network/helper/json_serializable_converter.dart';

class Client {
  static ChopperClient getClient() {
    String url = 'http://localhost:8000';
    final client = ChopperClient(
      baseUrl: url,
      converter: JsonSerializableConverter(),
    );
    return client;
  }
}
