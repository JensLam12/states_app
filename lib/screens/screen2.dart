import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
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
                final newUser = User(name: 'Timmy', age: 35);
                userService.loadUser(newUser);
              },
              color: Colors.blue,
              child: const Text( 'Make user', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {
                userService.updateAge(30);
              },
              color: Colors.blue,
              child: const Text( 'Change age', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {

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