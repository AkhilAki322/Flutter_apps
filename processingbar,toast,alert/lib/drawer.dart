import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.amberAccent,
            width: 100,
            height: 100,
          )
        ],
      )
    );
  }
}
