import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/screens/screen1.dart';
import 'package:states_app/screens/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'screen1',
        routes: {
          'screen1': (_) => const Screen1(),
          'screen2': (_) => const Screen2(),
        },
      ),
    );
  }
}