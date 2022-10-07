import '../../../models/comment_model.dart';
import 'comments_provider.dart';

class CommentsRepository {
  CommentsProvider provider = CommentsProvider();

  Future<List<CommentsModel>> getComments(int id) {
    return provider.getComments('/posts/$id/comments');
  }

  Future<CommentsModel> postComment(
    int id,
    String name,
    String email,
    String body,
  ) {
    return provider.postComment(
      '/posts/$id/comments',
      {
        "name": name,
        "email":email,
        "body":body,
      },
    );
  }
}
