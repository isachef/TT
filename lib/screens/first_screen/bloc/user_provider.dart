import 'package:dio/dio.dart';
import 'package:technical_task/screens/helpers/api_requester.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

import '../../../models/user_model.dart';

class UserProvider{
  Future<List<UserModel>> getUsers(String path)async{
    ApiRequester apiRequester=ApiRequester();
    try{
      Response response=await apiRequester.toGet(path);
      if(response.statusCode==200){

        return response.data.map<UserModel>((e) => UserModel.fromJson(e)).toList();

      }else{
        throw CatchException.convertException(response.statusCode);
      }
    }catch(e){
      throw CatchException.convertException(e);
    }
  }

}