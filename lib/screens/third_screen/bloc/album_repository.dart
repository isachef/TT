import 'package:technical_task/screens/third_screen/bloc/album_provider.dart';

import '../../../models/album_model.dart';

class AlbumRepository{
  AlbumProvider provider = AlbumProvider();

  Future<List<AlbumModel>> getAlbums(int id) {
    return provider.getAlbums('/users/$id/albums');
  }

  Future<List<AlbumModel>> getAllAlbums() {
    return provider.getAlbums('/albums');
  }
}