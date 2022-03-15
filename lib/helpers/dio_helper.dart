import 'package:dio/dio.dart';
import 'package:flutter_apis/utilities/constants/api_keys_constants.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );
  static Future<Response> getHttp({
    required url,
  }) async {
    return await dio.get(
      url,
    );
  }
}
