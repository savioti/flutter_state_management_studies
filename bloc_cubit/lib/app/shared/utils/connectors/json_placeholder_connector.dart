import 'package:estudo_bloc/app/shared/utils/connectors/dio.connector.dart';

class JsonPlaceholderConnectorInstance {
  JsonPlaceholderConnectorInstance._();

  static final DioConnector dioConnector =
      DioConnector('https://jsonplaceholder.typicode.com');
}
