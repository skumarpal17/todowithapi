import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todobyapi/todo_model.dart';

class TodoController extends GetxController {
  var datalist = <TodoModel>[].obs;

  addTodo(String title, String description) async {
    var data = {
      "title": title,
      "description": description,
      "is_completed": true
    };
    final response = await http.post(
        Uri.parse("https://api.nstack.in/v1/todos"),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'});
    print("statusCode ${response.statusCode}");
  }

  Future<List<TodoModel>> getData() async {
    final response = await http
        .get(Uri.parse("https://api.nstack.in/v1/todos?page=1&limit=10"));
    print("response.statusCode ${response.statusCode}");

    if (response.statusCode == 200) {
      datalist.value.clear();
      var body = jsonDecode(response.body);
      var data = body['items'];
      print("data $data");
      data.forEach((d) {
        datalist.add(TodoModel.fromJson(d));
      });
      print("datalit $datalist");
      return datalist;
    }
    return datalist;
  }

  deleteData(String id) {
    final response =
        http.delete(Uri.parse("https://api.nstack.in/v1/todos/$id"));
  }
}
