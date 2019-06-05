import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png', height: 100.0, width: 100.0,),
                SizedBox(height: 16.0),
                Text('Stay Hydrated'),
                SizedBox(height: 120.0),
                TextField(
                  decoration: InputDecoration(
                    //filled: true,
                    //fillColor: Colors.blueAccent[100],
                    labelText: "Username"
                  ),
                  controller: _usernameController,
                ),
                SizedBox(height: 50.0),
                TextField(
                  decoration: InputDecoration(
                    //filled: true,
                    labelText: "Password"
                  ),
                  controller: _passwordController,
                  obscureText: true,
                ),
                  ],
                ),
                SizedBox(height: 50.0),
                ButtonTheme(
                  minWidth: 88.0,
                  height: 40.0,
                  child:
                    FlatButton(
                      child: Text('Login'),
                      color: Colors.blue[300],
                      disabledColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(5)),),
                      onPressed:  (){
                        Navigator.pop(context);
                      },
                    ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 6.0, 8.0, 0.0),
                  child: Text('Forgot Password?', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.right,)
                ),
                SizedBox(height: 100.0),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
                  child: Text('Dont have an account?', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
                  child: Text('Sign up', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center),
                )
          ],
        ),
      ),
    );
  }
}

