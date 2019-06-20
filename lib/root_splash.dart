import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'home_page.dart';

class RootSplash extends StatefulWidget{
  RootSplash({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => _RootSplashState();
}

enum AuthStatus{
  signedIn,
  notSignedIn
}

class _RootSplashState extends State<RootSplash>{

  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentUser().then((token){
      setState(() {
      authStatus = token == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(auth: widget.auth, onSignedIn: _signedIn,)),
        );
        break;*/
        return new LoginPage(auth: widget.auth, onSignedIn: _signedIn,);
      case AuthStatus.signedIn:
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(auth: widget.auth, onSignedOut: _signedOut,)),
        );*/
        return new HomePage(auth: widget.auth, onSignedOut: _signedOut,);
    }
  }
}