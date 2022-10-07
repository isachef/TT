import 'package:technical_task/models/photo_model.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_provider.dart';

class PhotoRepository{
  PhotoProvider provider = PhotoProvider();

  Future<List<PhotoModel>> getPhotos(int id) {
    return provider.getPhotos('/albums/$id/photos');
  }


}