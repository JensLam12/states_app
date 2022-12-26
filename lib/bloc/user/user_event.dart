part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActiveUser extends UserEvent{
  final User user;

  ActiveUser(this.user);
}

class UpdateUserAge extends UserEvent{
  final int age;

  UpdateUserAge(this.age);
}

class UpdateProfessions extends UserEvent{
  final String profession;

  UpdateProfessions(this.profession);
}

class RemoveUser extends UserEvent{ }