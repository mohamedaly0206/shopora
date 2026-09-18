import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopora/config/networking/api_interceptor.dart';
import 'package:shopora/core/values/api_endpoints.dart';

@module
abstract class DioModule {
  @singleton
  Dio provideDio(ApiInterceptor interceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(interceptor);

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: true,
          filter: (options, args) {
            if (options.path.contains('/posts')) {
              return false;
            }
            return !args.isResponse || !args.hasUint8ListData;
          },
        ),
      );
    }

    return dio;
  }
}
