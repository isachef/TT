import 'package:technical_task/screens/second_screen/blo%D1%81/post_provider.dart';

import '../../../models/post_model.dart';

class PostRepository{
  PostProvider provider = PostProvider();

  Future<List<PostModel>> getPosts(int id) {
    return provider.getPosts('/users/${id}/posts');
  }

  Future<List<PostModel>> getAllPosts() {
    return provider.getPosts('/posts');
  }
}