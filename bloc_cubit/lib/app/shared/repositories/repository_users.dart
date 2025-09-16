import 'package:dio/dio.dart';
import 'package:estudo_bloc/app/shared/utils/connectors/json_placeholder_connector.dart';

class RepositoryUsersInstance {
  RepositoryUsersInstance._();

  static final RepositoryUsers repository = RepositoryUsers();
}

class RepositoryUsers {
  final Dio _dio = JsonPlaceholderConnectorInstance.dioConnector.dio;

  Future<Response<String>> getUsersData() async {
    try {
      Response<String> _response = await _dio.get("/users");
      return _response;
    } catch (e) {
      throw e;
    }
  }
}
