import 'package:dio/dio.dart';

class DioConnector {
  final _url;
  final int connectTimeout;
  final int receiveTimeout;

  DioConnector(
    this._url, {
    this.connectTimeout = 30000,
    this.receiveTimeout = 30000,
  }) {
    _initializeDio();
  }

  Dio dio;

  void _initializeDio() {
    BaseOptions options = BaseOptions(
      baseUrl: _url,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      validateStatus: (status) {
        return status <= 500;
      },
    );
    dio = Dio(options);
  }
}
