import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';

void main() => runApp(new Zucced());

class Zucced extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'you just got zucced',
      home: LoginPage(auth: new Auth(),)
    );
  }
}