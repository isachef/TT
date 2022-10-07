import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_task/models/album_model.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';
import 'package:technical_task/screens/second_screen/blo%D1%81/post_repository.dart';
import 'package:technical_task/screens/third_screen/bloc/album_repository.dart';

import '../../../models/post_model.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    PostRepository postRepository = PostRepository();
    on<GetPosts>((event, emit) async {
      List<PostModel> postModelList;
      int count = 0;
      try {
        postModelList =
            await postRepository.getPosts(event.id);

        emit(PostFetchedState(postModelList));
      } catch (e) {
        emit(PostErrorState(CatchException.convertException(e)));
      }
    });
    on<GetThreePosts>((event, emit) async {
      List<PostModel> postModelList;
      List<PostModel> postFilterList = [];
      AlbumRepository albumRepository = AlbumRepository();
      List<AlbumModel> albumModelList =
          await albumRepository.getAlbums(event.id);
      List<AlbumModel> albumFilterList = [];

      try {
        postModelList =
            await postRepository.getPosts(event.id);

        for (int i = 0; i < 3; i++) {
          postFilterList.add(postModelList[i]);
          albumFilterList.add(albumModelList[i]);
        }

        emit(ThreePostFetchedState(postFilterList, albumFilterList));
      } catch (e) {
        emit(PostErrorState(CatchException.convertException(e)));
      }
    });
  }
}
