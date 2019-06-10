import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

  enum FormType{
    login,
    register
  }

class _LoginPageState extends State<LoginPage>{
  String _email;
  String _password;
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  void validateAndSubmit() async{
    if(validateAndSave()){
      try{
        if(_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('signed in $userId');
        }
        else{
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print('registered $userId');
        }
      }
      catch(e){
        print('Error: $e');
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  List<Widget> usernamePassword(){
    return[
       TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelText: "Username",
          //errorText: 'Username already exists.',
          labelStyle: TextStyle(fontSize: 13.0)
        ),
        controller: _usernameController,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        enableInteractiveSelection: true,
        onSaved: (val) => _email = val,
      ),
      SizedBox(height: 50.0),
      TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelText: "Password",
          labelStyle: TextStyle(fontSize: 13.0),
           //errorText: "Password must be 6 characters long."
        ),
        controller: _passwordController,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
        obscureText: true,
      ),
    ];
  }

  List<Widget> submitButtons(){
    if(_formType == FormType.login){
      return[
        SizedBox(height: 20.0),
        ButtonTheme(
          minWidth: 88.0,
          height: 40.0,
          child:
            FlatButton(
              child: Text('Login', style: TextStyle(color: Colors.white)),
              color: Colors.blue[700],
              disabledColor: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(5)),),
              onPressed: validateAndSubmit
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
            child: Text('Forgot Password?', style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline), textAlign: TextAlign.right,),
            onPressed: (){},
            )
          ],
        ),
        SizedBox(height: 80.0),
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: Text('Dont have an account?', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
        ),
        Container(
          child: FlatButton(
            child: Text('Sign up', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center),
            onPressed: moveToRegister,
            materialTapTargetSize: MaterialTapTargetSize.padded,)
        )      
      ];
    }
    else{
      return[
        SizedBox(height: 20.0),
        ButtonTheme(
          minWidth: 88.0,
          height: 40.0,
          child:
            FlatButton(
              child: Text('Create an account', style: TextStyle(color: Colors.white)),
              color: Colors.blue[700],
              disabledColor: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(5)),),
              onPressed: validateAndSubmit
            ),
        ),
        SizedBox(height: 127.0),
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: Text('Already have an account?', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
        ),
        Container(
          child: FlatButton(
            child: Text('Login', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center),
            onPressed: moveToLogin,)
        )      
      ];
    }
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            Image.asset('assets/logo.png', height: 100.0, width: 100.0,),
            SizedBox(height: 65.0),
            Text('you just got zucced', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),textAlign: TextAlign.center,),
            SizedBox(height: 65.0),
            Form(
              key: formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: usernamePassword() + submitButtons(),
              )
            )
          ],
        )
      )
    );
  }
}