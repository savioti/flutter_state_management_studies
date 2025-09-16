import 'package:study_flutter_get_it/app/shared/util/logger.dart';

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('${DateTime.now()} : $message');
  }
}
