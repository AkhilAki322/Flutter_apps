import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'note.dart';

class screen11 extends StatefulWidget {
  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen11> {
  TextStyle sty = TextStyle(
    fontSize: 20,
  );
  DBHelper dbHelper = DBHelper();
  Future<List> employees;
  List employees1;

  static String _image;
  static String _name;
  static String _address;
  static int ee = 1;

  @override
  void initState() {
    ee = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context).settings.arguments;
    print(name);
    employees = dbHelper.retrival(name);
    employees.then((asd) {
      employees1 = asd;
      if (ee==1) {
        setState(() {
          _image = employees1[0]['image'];
          _name = employees1[0]['name'];
          _address = employees1[0]['Address'];
        });
        ee = 0;
      }
    });
    print("dddd");
    print(employees1[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Pension App"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white,
            )
          ],
        ),
        body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage("images/$_image"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Name: $_name",
                        style: sty,
                      ),
                      Text("Address: $_address, Marautha PO, Malappuram, PIN: 679333",
                        style: sty,
                      ),
                      Text("Pension Type: Indira Gandhi National Old and Pension Scheme",
                        style: sty,
                      ),
                      Text("Pen Id: 1230987456",
                        style: sty,
                      ),
                      Text("Adhar_No: 645734852190",
                        style: sty,
                      ),
                      Text("Phn_No: 645734852190",
                        style: sty,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue,
                            onPressed: () {},
                            child: Text("Add Signature",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
