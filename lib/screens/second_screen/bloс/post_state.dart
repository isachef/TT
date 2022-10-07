part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostFetchedState extends PostState{
  final List<PostModel> postModelList;

  PostFetchedState(this.postModelList);
}

class ThreePostFetchedState extends PostState{
  final List<PostModel> postModelList;
  final List<AlbumModel> albumModelList;

  ThreePostFetchedState(this.postModelList, this.albumModelList);
}

class PostErrorState extends PostState{
  final CatchException error;

  PostErrorState(this.error);
}
