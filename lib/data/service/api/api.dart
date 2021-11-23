import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Api{
  static const baseUrl = 'http://api.myfeel.me';
  static const Duration timeout = Duration(seconds: 30);
  static const int connectTimeout = 10000;
  final Dio dio;

  Api({
    Dio? dio,
    String? basePathOverride,
  }) : this.dio = dio ??
      Dio(BaseOptions(
        baseUrl: basePathOverride ?? baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )) {
  }

  Dio buildDio() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }
}