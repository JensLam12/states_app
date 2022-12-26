import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/screens/screen2.dart';

import '../models/user.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {

    final userCtrl = Get.put( UserController() );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Obx( () => userCtrl.existsUser.value ? userInfo( user: userCtrl.user.value ) : const NoInfo() ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new),
        onPressed: () => Get.toNamed( 'screen2' ),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("There's no user selected"),
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