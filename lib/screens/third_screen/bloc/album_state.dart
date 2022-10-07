part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumFetchedState extends AlbumState{
  final List<AlbumModel> albumModelList;

  AlbumFetchedState(this.albumModelList);
}

class AlbumErrorState extends AlbumState{
  final CatchException error;

  AlbumErrorState(this.error);
}