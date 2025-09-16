import 'package:mobx/mobx.dart';
import 'package:study_flutter_mobx/data/network/api/posts/post_api.dart';

import '../../data/models/post/post.dart';

part 'post_store.g.dart';

class PostStore = PostStoreBase with _$PostStore;

abstract class PostStoreBase with Store {
  PostStoreBase(PostApi postApi) : _postApi = postApi;
  late final PostApi _postApi;

  // #2
  // store variables:-----------------------------------------------------------
  @observable
  List<Post> posts = [];

  @observable
  bool isLoading = false;

  // #3
  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    isLoading = true;
    final postList = await _postApi.getPosts();
    posts = postList;
    isLoading = false;
  }
}
