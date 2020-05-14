import 'package:deneme4/denemehttp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(deneme4());
}

class deneme4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amber
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tarumar"),
        ),
        body: denemehttp()
      ),
    );
  }
}
