import 'package:flutter/material.dart';
import 'package:study_flutter_mobx/infra/dependency_injection/service_locator.dart';
import 'package:study_flutter_mobx/ui/pages/home_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
