import 'package:dio/dio.dart';

/// I changed the baseUrl because is not public API
class DioConfigOptions {
  static String baseUrl = "http://dev.fake.io/api/";
  static Future<BaseOptions> getBaseOption() async {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return options;
  }
}
