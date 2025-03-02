import 'package:dio/dio.dart';
import 'package:divar_aviz/config/constants/const_strings.dart';
import 'package:divar_aviz/di/di_init.dart';

class DioProvider {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
      ),
    );
  }

  static setDioHeaderToken(String? token) {
    if (token == null) {
      locator<Dio>().options.headers.remove('Authorization');
    } else {
      locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
    }
  }
}
