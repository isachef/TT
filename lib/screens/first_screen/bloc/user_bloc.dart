import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_task/screens/first_screen/bloc/user_repository.dart';
import 'package:technical_task/screens/helpers/catch_exception.dart';

import '../../../models/user_model.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      UserRepository userRepository = UserRepository();
      List<UserModel> userModelList;

      try {
        userModelList = await userRepository.getUsers();
        emit(UsersFetchedState(userModelList));
      } catch (e) {
        emit(
          UserErrorState(
            CatchException.convertException(e),
          ),
        );
      }
    });
  }
}
