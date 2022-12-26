import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc(): super(const UserInitialState() ){
    on<ActiveUser>( (event, emit) {
      emit( UserSetSate(event.user));
    });

    on<UpdateUserAge>( (event, emit) {
      if(!state.existUser) return;
      emit( UserSetSate(state.user!.copyWith(age: event.age)));
    });

    on<UpdateProfessions>( (event, emit) {
      if(!state.existUser) return;
      emit( UserSetSate( state.user!.copyWith( 
        professions: [ 
          ...state.user!.professions, 
          event.profession 
        ]))
      );
    });

    on<RemoveUser>( (event, emit) {
      if(!state.existUser) return;
      emit( const UserInitialState());
    });
  }
}