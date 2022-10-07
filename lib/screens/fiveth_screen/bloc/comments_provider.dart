import 'package:dio/dio.dart';

import '../../../models/comment_model.dart';
import '../../helpers/api_requester.dart';
import '../../helpers/catch_exception.dart';

class CommentsProvider{
  ApiRequester apiRequester=ApiRequester();

  Future<List<CommentsModel>> getComments(String path)async{

    try{
      Response response=await apiRequester.toGet(path);
      if(response.statusCode==200){
        return response.data.map<CommentsModel>((e) => CommentsModel.fromJson(e)).toList();

      }else{
        throw CatchException.convertException(response.statusCode);
      }
    }catch(e){
      throw CatchException.convertException(e);
    }
  }

  Future<CommentsModel> postComment(String path,dynamic data)async{

    try{
      Response response=await apiRequester.toPost(path,data);
      if(response.statusCode==200){
        return response.data.map<CommentsModel>((e) => CommentsModel.fromJson(e)).toList();

      }else{
        throw CatchException.convertException(response.statusCode);
      }
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
}