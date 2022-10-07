import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_task/screens/third_screen/bloc/album_repository.dart';

import '../../../models/album_model.dart';
import '../../helpers/catch_exception.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    AlbumRepository albumRepository = AlbumRepository();

    on<GetThreeAlbum>((event, emit) async {
      List<AlbumModel> albumModelList =
          await albumRepository.getAlbums(event.id);
      List<AlbumModel> albumFilterList = [];

      try {
        for (int i = 0; i < 3; i++) {
          albumFilterList.add(albumModelList[i]);
        }

        emit(AlbumFetchedState(albumFilterList));
      } catch (e) {
        emit(AlbumErrorState(CatchException.convertException(e)));
      }
    });
    on<GetAlbums>((event, emit) async {
      try {
        List<AlbumModel> albumModelList =
            await albumRepository.getAlbums(event.id);

        emit(AlbumFetchedState(albumModelList));
      } catch (e) {
        emit(AlbumErrorState(CatchException.convertException(e)));
      }
    });
  }
}
