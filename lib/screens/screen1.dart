import 'package:flutter/material.dart';
import 'package:states_app/services/user_service.dart';

import '../models/user.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream.stream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData 
          ? userInfo(user: snapshot.data!)
          : const Center( child: Text('There is no information of user') );
        }
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
          ListTile( title: Text('Name: ${user.name}' ) ),
          ListTile( title: Text('Edad: ${user.age}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),
          const ListTile( title: Text('Profesion 1') ),
          const ListTile( title: Text('Profesion 2') ),
          const ListTile( title: Text('Profesion 3') ),
        ],
      ),
    );
  }
}