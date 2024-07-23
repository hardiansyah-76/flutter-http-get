import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        name: object["first_name"] + "" + object["last_name"],
        id: object["id"].toString());
  }

  static Future<List<User>> getUser(String page) async {
    Uri apiUrl = Uri.parse("https://reqres.in/api/users?page=" + page);

    var apiResult = await http.get(apiUrl);
    var jsonObject = jsonDecode(apiResult.body);

    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)["data"];
    List<User> users = [];

    for (int i = 0; i < listUser.length; i++)
      users.add(User.createUser(listUser[i]));

    return users;
  }
}
