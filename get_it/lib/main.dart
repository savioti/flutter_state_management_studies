import 'package:flutter/material.dart';
import 'package:study_flutter_get_it/app/app.dart';
import 'package:study_flutter_get_it/app/shared/service_injection/service_locator.dart';
import 'package:study_flutter_get_it/app/shared/util/file_logger.dart';

void main() {
  serviceLocationSetUp();
  final logger = serviceLocator.get<FileLogger>();
  logger.log('started app');
  runApp(const App());
}
