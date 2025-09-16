import 'package:get_it/get_it.dart';
import 'package:study_flutter_mobx/data/network/api/posts/post_api.dart';
import 'package:study_flutter_mobx/stores/post/post_store.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerSingleton(PostApi());
  serviceLocator.registerSingleton(PostStore(serviceLocator.get<PostApi>()));
}
