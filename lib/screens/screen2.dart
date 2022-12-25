import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import '../services/users_service.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UsersService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.existsUser ? Text(userService.user!.name) : const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = User(
                  name: "Brygaht", 
                  age: 29,
                  professions: ["Fullstack Developer","Professional player"]
                );
                userService.user = newUser;
              },
              color: Colors.blue,
              child: const Text( 'Make user', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {
                userService.updateAge(38);
              },
              color: Colors.blue,
              child: const Text( 'Change age', style: TextStyle( color: Colors.white) ),
            ),
            MaterialButton(
              onPressed: () {
                userService.addProfession();
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