import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todobyapi/randomuser/randomuser_controller.dart';
import 'package:todobyapi/randomuser/randomuser_model.dart';

class RandomUserView extends StatelessWidget {
  RandomUserView({Key? key}) : super(key: key);
  RandomController randomController = RandomController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<RandomUser>(
            future: randomController.getUser(),
            builder: (context, snapshot) {
              // print("snapshots ${snapshot.data!.results!}");
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(index.toString()),
                        title:
                            Text("${snapshot.data!.results[index].name.first}"),
                      );
                    });
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("error"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
