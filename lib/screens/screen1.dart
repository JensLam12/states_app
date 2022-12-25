import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/services/users_service.dart';

import '../models/user.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UsersService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: [
          IconButton(
            onPressed: userService.removeUser, 
            icon: const Icon( Icons.exit_to_app)
          )
        ],
      ),
      body: userService.existsUser 
        ? userInfo(user: userService.user!) 
        : const Center(child: Text("There's no user selected" ) 
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class userInfo extends StatelessWidget {
  final User user;
  const userInfo({
    Key? key, 
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),
          ListTile( title: Text('Name: ${user.name}') ),
          ListTile( title: Text('Edad: ${user.age}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),
          ...user.professions!.map(
            (profession) => ListTile( title: Text(profession) )
          ).toList()
        ],
      ),
    );
  }
}