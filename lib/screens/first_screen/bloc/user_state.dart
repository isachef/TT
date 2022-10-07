part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UsersFetchedState extends UserState {
  final List<UserModel> userModelList;

  UsersFetchedState(this.userModelList);
}

class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState(this.error);
}
