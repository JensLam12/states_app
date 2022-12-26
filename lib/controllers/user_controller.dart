import 'package:get/get.dart';
import 'package:states_app/models/user.dart';

class UserController extends GetxController{
  var existsUser = false.obs;
  var user = User().obs;

  int get professionsQuantity {
    return user.value.professions.length;
  }

  void loadUser( User user) {
    existsUser.value = true;
    this.user.value = user;
  }

  void updateAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession( String profession) {
    user.update((val) {
      val!.professions = [
        ...val!.professions,
        profession
      ];
    });
  }
}