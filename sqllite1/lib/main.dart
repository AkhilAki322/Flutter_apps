import 'package:flutter/material.dart';
import 'drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.amberAccent,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Demo"),
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}


