import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Ninja ID Card"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel+=1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[400],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/a.jpg"),
                radius: 40,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.pink,
            ),
            Text(
              'NAME',
                  style: TextStyle(
                    color: Colors.indigo,
                    letterSpacing: 2,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              "Akhil M R",
              style: TextStyle(
                color: Colors.indigo,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
            ),
          ),
            SizedBox(height: 30,),
            Text(
              'Current Ninja Level',
              style: TextStyle(
                color: Colors.indigo,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.indigo,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 10,),
                Text(
                  "akhilaki322@gamil.com",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                )
              ],
            )
        ],
      ),
      ),
    );
  }
}