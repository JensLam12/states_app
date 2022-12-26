import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = User(
                  name: 'Arnold', 
                  age: 55, 
                  professions: [
                    'FullStack Web Developer'
                  ]);
                userBloc.add(ActiveUser(newUser));
              },
              color: Colors.blue,
              child: const Text( 'Make user', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(UpdateUserAge(25));
              },
              color: Colors.blue,
              child: const Text( 'Change age', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(UpdateProfessions("Profesion ${ userBloc.state.user!.professions.length + 1}") );
              },
              color: Colors.blue,
              child: const Text( 'Add profession', style: TextStyle( color: Colors.white) ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'screen1'),
      ),
    );
  }
}