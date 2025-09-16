import 'package:get_it/get_it.dart';
import 'package:study_flutter_get_it/app/shared/util/console_logger.dart';
import 'package:study_flutter_get_it/app/shared/util/file_logger.dart';

final serviceLocator = GetIt.instance;

void serviceLocationSetUp() {
  serviceLocator.registerLazySingleton<ConsoleLogger>(() => serviceLocator());
  serviceLocator.registerLazySingleton<FileLogger>(() => serviceLocator());
}
