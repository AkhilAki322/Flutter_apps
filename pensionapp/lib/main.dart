import 'package:flutter/material.dart';
import 'Main_drawer.dart';
import 'category_selector.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pension App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.search
              ),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(
                  Icons.exit_to_app
              ),
              onPressed: () {

              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
          ]
        ),
    ),
    );
  }
}
