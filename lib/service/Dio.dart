import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  // ios
  // dio.options.baseUrl = "http://localhost:8000/api";

  // android
  dio.options.baseUrl = "https://mnpos8.sdtapp.xyz/api";

  return dio;
}
