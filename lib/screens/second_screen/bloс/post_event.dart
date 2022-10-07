part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPosts extends PostEvent{
  final int id;

  GetPosts({required this.id});
}

class GetThreePosts extends PostEvent{
  final int id;

  GetThreePosts({required this.id});
}