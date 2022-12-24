import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: userInfo(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class userInfo extends StatelessWidget {
  const userInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),
          ListTile( title: Text('Name: ') ),
          ListTile( title: Text('Edad: ') ),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),
          ListTile( title: Text('Profesion 1') ),
          ListTile( title: Text('Profesion 2') ),
          ListTile( title: Text('Profesion 3') ),
        ],
      ),
    );
  }
}