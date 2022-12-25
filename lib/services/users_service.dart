import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class UsersService with ChangeNotifier {
  User? _user;
  
  User? get user => _user;
  bool get existsUser => _user != null ? true : false;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void updateAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user?.professions?.add('Profession ${_user!.professions!.length + 1}');
    notifyListeners();
  }
}