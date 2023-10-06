
import 'package:dio/dio.dart';
import 'package:logique/config/network/api_interceptors.dart';

class DioHandler {
  final String apiBaseUrl;

  DioHandler({
    required this.apiBaseUrl,
  });

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 50000),
    );
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }


}
