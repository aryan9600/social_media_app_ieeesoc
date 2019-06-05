import 'package:flutter/material.dart';
import 'login.dart';

class StayHydratedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Stay Hydrated',

      home: LoginPage(),
    );
  }
}