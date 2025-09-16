import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estudo_bloc/app/shared/models/user.dart';
import 'package:estudo_bloc/app/shared/repositories/repository_users.dart';

class UsersService {
  final _usersRepository = RepositoryUsersInstance.repository;

  Future<List<User>> getUsers() async {
    try {
      Response _result = await _usersRepository.getUsersData();
      if (_result.statusCode != 200) throw _result.statusMessage;
      final List<dynamic> _resultData = json.decode(_result.data);
      _resultData.map((e) => User.fromJson(e)).toList();
      final List<User> users = [];

      if (_resultData != null && _resultData.isNotEmpty)
        _resultData.forEach((element) {
          User user = User.fromJson(element);
          users.add(user);
        });

      return users;
    } catch (e) {
      throw e;
    }
  }
}
