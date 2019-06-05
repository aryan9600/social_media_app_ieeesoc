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
                SizedBox(height: 30.0),
                Image.asset('assets/logo.png', height: 100.0, width: 100.0,),
                SizedBox(height: 65.0),
                Text('you just got zucced', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                SizedBox(height: 65.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    //errorText: 'Username already exists.',
                    labelStyle: TextStyle(fontSize: 13.0)
                  ),
                  controller: _usernameController,
                  enableInteractiveSelection: true,
                ),
                SizedBox(height: 50.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 13.0),
                    //errorText: "Password must be 6 characters long."
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
                      child: Text('Login', style: TextStyle(color: Colors.white)),
                      color: Colors.blue[700],
                      disabledColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(5)),),
                      onPressed:  (){
                        Navigator.pop(context);
                      },
                    ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 6.0, 8.0, 0.0),
                  child: Text('Forgot Password?', style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline), textAlign: TextAlign.right,)
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

