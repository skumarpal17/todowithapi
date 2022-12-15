import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todobyapi/todo_controller.dart';

class AddTodo extends StatelessWidget {
  TodoController todoController;
  AddTodo({Key? key, required this.todoController}) : super(key: key);

  TextEditingController titieControllr = TextEditingController();
  TextEditingController descriptionControllr = TextEditingController();

  // TodoController todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titieControllr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptionControllr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await todoController.addTodo(
                      titieControllr.text, descriptionControllr.text);
                  await todoController.getData();
                  Get.back();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
