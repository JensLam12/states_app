import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_cubit.dart';

import '../models/user.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UserCubit>().removeUser(), 
            icon: const Icon( Icons.exit_to_app)
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _, state) { 

        switch(state.runtimeType) {
          case UserInitial:
            return const Center( child:  Text("There's no information of user"));
          case activeUser:
            return userInfo( user: ( state as activeUser).user  );
          default: 
            return const Center( child: Text("State doesn't recognized"));
        }

        // if( state is UserInitial ) {
        //   return const Center( child:  Text("There's no information of user"));
        // } else if( state is activeUser ) {
        //   return userInfo( user: state.user );
        // }else{
        //   return const Center( child: Text("State doesn't recognized"));
        // }
      }
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
          ...user.professions.map(
            (profession) => ListTile( title: Text(profession) )
          ).toList()
        ],
      ),
    );
  }
}