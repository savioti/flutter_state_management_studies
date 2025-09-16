import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:study_flutter_mobx/data/models/post/post.dart';

class PostApi {
  Future<List<Post>> getPosts() async {
    try {
      final res = await http.get(
        Uri.parse(
          "http://jsonplaceholder.typicode.com/posts",
        ),
      );
      final data = (jsonDecode(res.body) as List)
          .map((post) => Post.fromMap(post))
          .toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
