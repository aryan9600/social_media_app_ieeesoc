import 'package:flutter/material.dart';
import 'root_splash.dart';

void main() => runApp(new Zucced());

class Zucced extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'you just got zucced',
      home: RootSplash()
    );
  }
}