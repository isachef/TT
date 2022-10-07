import 'package:dio/dio.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

class ApiRequester {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  Dio initDio() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        responseType: ResponseType.json,
      ),
    );
  }

  Future<Response> toGet(String path){
    Dio dio=initDio();
    try{
      return dio.get(path);
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
  
  Future<Response> toPost(String path,dynamic data){
    Dio dio=initDio();
    try{
      return dio.post(path,data: data);
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
}
