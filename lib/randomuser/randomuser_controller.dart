import 'dart:convert';

import 'package:get/get.dart';
import 'package:todobyapi/randomuser/randomuser_model.dart';
import 'package:http/http.dart' as http;

class RandomController extends GetxController {
  var users = <RandomUser>[].obs;

  Future<RandomUser> getUser() async {
    final respones =
        await http.get(Uri.parse("https://randomuser.me/api/?results=5"));
    var body = jsonDecode(respones.body.toString());
    if (respones.statusCode == 200) {
      var data = body['results'];
      // print("daata $data");
      // data.forEach((user) {
      //   print("user $user");
      //   users.add(RandomUser.fromJson(user));
      //   print("randomuser");
      //   //print
      //   // ("usersList $user");
      // });
      return RandomUser.fromJson(body);
    }
    return RandomUser.fromJson(body);
  }
}
