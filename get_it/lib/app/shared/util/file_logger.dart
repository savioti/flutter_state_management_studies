import 'package:path_provider/path_provider.dart';
import 'package:study_flutter_get_it/app/shared/util/logger.dart';

import 'dart:io';

class FileLogger implements Logger {
  late final File file;
  bool _isInitialized = false;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    file = File(directory.path);
    _isInitialized = true;
  }

  @override
  void log(String message) async {
    if (!_isInitialized) {
      await init();
    }

    String logMsg = '${DateTime.now()} $message \n';
    file.writeAsString(logMsg, mode: FileMode.append);
  }
}
