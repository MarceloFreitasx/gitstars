import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gitstars/src/main/controllers/main.controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitStars"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("Main"),
            ),
          ],
        ),
      ),
    );
  }
}
