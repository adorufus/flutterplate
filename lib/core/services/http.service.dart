import 'package:dio/dio.dart';

class HttpService {
  late final Dio dio;

  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com', // Change to your API base URL
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('[DIO][REQUEST] => PATH: ${options.path}');
          print('[DIO][REQUEST] => METHOD: ${options.method}');
          print('[DIO][REQUEST] => HEADERS: ${options.headers}');
          print('[DIO][REQUEST] => DATA: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('[DIO][RESPONSE] => PATH: ${response.requestOptions.path}');
          print('[DIO][RESPONSE] => STATUS: ${response.statusCode}');
          print('[DIO][RESPONSE] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('[DIO][ERROR] => PATH: ${e.requestOptions.path}');
          print('[DIO][ERROR] => MESSAGE: ${e.message}');
          print('[DIO][ERROR] => RESPONSE: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }
}
