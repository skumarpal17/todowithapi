import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todobyapi/todo_add.dart';
import 'package:todobyapi/todo_controller.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);
  TodoController todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: todoController.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Obx(() => ListView.builder(
                  itemCount: todoController.datalist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("$index"),
                      title: Text("${todoController.datalist[index].title}"),
                      trailing: IconButton(
                        onPressed: () async {
                          await todoController.deleteData(
                              todoController.datalist[index].sId.toString());
                          await todoController.getData();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.hasError}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: AddTodo(
                        todoController: todoController,
                      )),
                );
              });
        },
        child: Text("+"),
      ),
    );
  }
}
