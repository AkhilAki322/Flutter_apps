import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
//    print(data);
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                        Icons.edit_location,
                    color: Colors.grey,
                    ),
                    label: Text(
                        "Edit Location",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
