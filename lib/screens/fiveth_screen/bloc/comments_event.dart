part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent{
  final int postId;

  GetCommentsEvent(this.postId);
}

class PostCommentEvent extends CommentsEvent{
  final int postId;
  final String name;
  final String email;
  final String body;

  PostCommentEvent(this.postId, this.name, this.email, this.body);
}