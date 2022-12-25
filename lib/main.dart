import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/screens/screen1.dart';
import 'package:states_app/screens/screen2.dart';
import 'package:states_app/services/users_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersService() )
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