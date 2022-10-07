import 'package:dio/dio.dart';
import 'package:technical_task/models/photo_model.dart';
import 'package:technical_task/screens/helpers/api_requester.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

class PhotoProvider {
  ApiRequester apiRequester = ApiRequester();

  Future<List<PhotoModel>> getPhotos(String path) async {
    try {
      Response response = await apiRequester.toGet(path);
      if (response.statusCode == 200) {
        return response.data
            .map<PhotoModel>((e) => PhotoModel.fromJson(e))
            .toList();
      } else {
        throw CatchException.convertException(response.statusCode);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
