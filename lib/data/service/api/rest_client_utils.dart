import 'package:dio/dio.dart';
import 'api.dart';

class RestClientUtils {
  static Api initOpenapi() {

    return Api(
      dio: Dio(
        BaseOptions(
          baseUrl: Api.baseUrl,
          connectTimeout: Api.connectTimeout,
          receiveTimeout:  Api.connectTimeout,
        ),
      ),
    );
  }
}