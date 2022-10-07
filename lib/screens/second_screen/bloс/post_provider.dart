import 'package:dio/dio.dart';
import 'package:technical_task/screens/helpers/api_requester.dart';

import '../../../models/post_model.dart';
import '../../helpers/catch_exception.dart';

class PostProvider{
  ApiRequester apiRequester=ApiRequester();

  Future<List<PostModel>> getPosts(String path)async{

    try{
      Response response=await apiRequester.toGet(path);
      if(response.statusCode==200){
        return response.data.map<PostModel>((e) => PostModel.fromJson(e)).toList();

      }else{
        throw CatchException.convertException(response.statusCode);
      }
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
}