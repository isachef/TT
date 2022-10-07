import 'package:dio/dio.dart';
import 'package:technical_task/models/album_model.dart';
import 'package:technical_task/screens/helpers/api_requester.dart';

import '../../helpers/catch_exception.dart';

class AlbumProvider{
  ApiRequester apiRequester=ApiRequester();

  Future<List<AlbumModel>> getAlbums(String path)async{

    try{
      Response response=await apiRequester.toGet(path);
      if(response.statusCode==200){
        return response.data.map<AlbumModel>((e) => AlbumModel.fromJson(e)).toList();

      }else{
        throw CatchException.convertException(response.statusCode);
      }
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
}