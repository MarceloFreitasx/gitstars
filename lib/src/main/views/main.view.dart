import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitStars"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Main"),
        ),
      ),
    );
  }
}
