part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsFetchedState extends CommentsState {
  final List<CommentsModel> commentsModelList;

  CommentsFetchedState(this.commentsModelList);
}

class CommentsErrorState extends CommentsState{
  final CatchException error;

  CommentsErrorState(this.error);
}
