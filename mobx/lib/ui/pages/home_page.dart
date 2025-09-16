import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:study_flutter_mobx/infra/dependency_injection/service_locator.dart';
import 'package:study_flutter_mobx/stores/post/post_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _postStore = serviceLocator.get<PostStore>();

  @override
  void initState() {
    getPost();
    super.initState();
  }

  Future<void> getPost() async {
    await _postStore.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Observer(
        builder: (context) {
          if (_postStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: _postStore.posts.length,
            itemBuilder: (context, index) {
              final post = _postStore.posts[index];
              return ListTile(
                title: Text(post.title ?? ""),
                subtitle: Text(post.body ?? ""),
              );
            },
          );
        },
      ),
    );
  }
}
