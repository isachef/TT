import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_task/screens/fiveth_screen/bloc/comments_repository.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

import '../../../models/comment_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<GetCommentsEvent>((event, emit) async{
      CommentsRepository commentsRepository=CommentsRepository();
      try {
        List<CommentsModel> commentsModelList;
        commentsModelList =
            await commentsRepository.getComments(event.postId);

        emit(CommentsFetchedState(commentsModelList));
      } catch (e) {
        emit(CommentsErrorState(CatchException.convertException(e)));
      }
    });
    on<PostCommentEvent>((event, emit) async{
      CommentsRepository commentsRepository=CommentsRepository();
      try {
        List<CommentsModel> commentsModelList;
        commentsModelList =
        await commentsRepository.getComments(event.postId);
        commentsModelList.add(await commentsRepository.postComment(event.postId, event.name, event.email, event.body));

        emit(CommentsFetchedState(commentsModelList));
      } catch (e) {
        emit(CommentsErrorState(CatchException.convertException(e)));
      }
    });
  }
}

