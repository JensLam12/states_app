import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super( UserInitial() );
  
  void selectUser( User user ) {
    emit( activeUser(user ));
  }

  void updateAge(int age ) {
    final currentState = state;
    if( currentState is activeUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit( activeUser(newUser));
    }
  }

  void addProfession() {
    final currentState = state;
    if( currentState is activeUser) {
      final professions = [ 
        ...currentState.user.professions,
        'Profession ${ currentState.user.professions.length + 1}'
      ];
      final newUser = currentState.user.copyWith(professions: professions);
      emit( activeUser(newUser));
    }
  }

  void removeUser() {
    emit(UserInitial());
  }
}