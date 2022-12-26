part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState{
  final existsUser = false;
}

class activeUser extends UserState {
  final existsUser = true;
  final User user;

  activeUser(this.user);
}