import 'package:dio/dio.dart';

import '../utilities/interceptors/dio_logging_interceptor.dart';

class DioClient {
  static Dio? _instance;

  static Dio get instance {
    _instance ??= _createDioInstance();
    return _instance!;
  }

  static Dio _createDioInstance() {
    final dio = Dio();

    // Add DioLoggingInterceptor
    dio.interceptors.add(DioLoggingInterceptor());

    return dio;
  }
}
