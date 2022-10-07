import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_task/models/album_model.dart';
import 'package:technical_task/models/photo_model.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_event.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_repository.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_state.dart';


class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<GetPhotoEvent>((event, emit) async{
PhotoRepository photoRepository=PhotoRepository();
try {
 List<PhotoModel>photoModelList;
 photoModelList=await photoRepository.getPhotos(event.id);

 emit(PhotoFetchedState(photoModelList));
} catch (e) {
  emit(PhotoErrorState(CatchException.convertException(e)));
}
    });
  }
}
