import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/sign_in.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Driven UI Demo',
      initialRoute: '/home',
      routes: {
        '/home': (_) => HomeScreen(),
        '/sign_in': (_) => SignInScreen(),
      },
    );
  }
}
