import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'user_class.dart';
import 'login_page.dart';

final registerUrl = Uri.encodeFull('http://192.168.0.101:8000/api/users');
final loginUrl = Uri.encodeFull('http://192.168.0.101:8000/api/users/login');
final userUrl = Uri.encodeFull('http://192.168.0.101:8000/api/user');

abstract class BaseAuth{
  Future<OuterUser> signIn(OuterUser outeruserLogin);
  Future<OuterUser> createUser(OuterUser outeruserLogin);
  Future<OuterUser> currentUser();
  Future<void> signOut();
}
class Auth implements BaseAuth{
  
  Future<OuterUser> signIn(OuterUser user) async{
    final response = await http.post('$loginUrl',
      headers: {
        'Content-Type': 'application/json'
      },
      body: outerUserToJson(user)
    );
    return outerUserFromJson(response.body);
  }

  Future<OuterUser> createUser(OuterUser user) async{
    final response = await http.post('$registerUrl',
      headers: {
        'Content-Type': 'application/json'
      },
      body: outerUserToJson(user)
    );
    return outerUserFromJson(response.body);
  }

  Future<OuterUser> currentUser() async{
    final response = await http.get('$userUrl',
      headers: {
        'Content-Type': 'application/json',
        'Authotiztion': '$userToken'
      }
    );
    return outerUserFromJson(response.body);
  }

  Future<void> signOut() async{

  }
}