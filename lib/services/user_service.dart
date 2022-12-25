import 'dart:async';

import '../models/user.dart';

class _UserService {
  User? _user;
  StreamController<User> _userStreamController = StreamController<User>();

  User? get user => _user;
  StreamController<User> get userStream => _userStreamController;
  bool get existUser => _user != null ? true: false;

  void loadUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void updateAge(int age) {
    _user!.age = age;
    _userStreamController.add(_user!);
  }
}

final userService = _UserService();

