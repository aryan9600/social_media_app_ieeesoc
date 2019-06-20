import 'dart:convert';

OuterUser outerUserFromJson(String str) => OuterUser.fromJson(json.decode(str));

String outerUserToJson(OuterUser data) => json.encode(data.toJson());

class OuterUser {
  User user;

  OuterUser({
      this.user
  });

  factory OuterUser.fromJson(Map<dynamic, dynamic> json) => new OuterUser(
      user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
      "user": user.toJson(),
  };
}

class User {
  String username;
  String email;
  String password;
  String token;
  User({
      this.username, //= 'hello',
      this.email, //= 'hello@example.com',
      this.password, //= 'examplepassword',
      this.token
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
      username: json["username"],
      email: json["email"],
      password: json["password"],
      token: json["token"]
  );

  Map<String, dynamic> toJson() => {
      "username": username,
      "email": email,
      "password": password,
      
  };
}
