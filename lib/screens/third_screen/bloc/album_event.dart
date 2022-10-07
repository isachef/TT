part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class GetThreeAlbum extends AlbumEvent{
  final int id;

  GetThreeAlbum(this.id);
}
class GetAlbums extends AlbumEvent{
  final int id;

  GetAlbums(this.id);
}