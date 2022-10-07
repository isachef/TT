
import 'package:technical_task/models/photo_model.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoFetchedState extends PhotoState {
  final List<PhotoModel> photoModelList;

  PhotoFetchedState(this.photoModelList);
}

class PhotoErrorState extends PhotoState {
  final CatchException error;

  PhotoErrorState(this.error);
}


