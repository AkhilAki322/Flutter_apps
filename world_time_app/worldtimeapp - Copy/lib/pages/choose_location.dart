import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("Akhil");
    });
    print("am waiting");
  }

  @override
  void initState() {
    print("init");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
