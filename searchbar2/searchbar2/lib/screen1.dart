import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'note.dart';

class ExamplePage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = [
        {'pen_id': '1234567890', 'name': 'akhil', 'Address': 'Madathodi House', 'Adhar': '123456781234', 'phone': '1234568987','amount': 2500, 'image': 'dq.PNG', 'status': 'pen'},
        {'pen_id': '1232331345', 'name': 'deepak', 'Address': 'Vattaparambil House', 'Adhar': '114555478904', 'phone': '1234568987','amount': 2500, 'image': 'aliya.PNG', 'status': 'pen'},
        {'pen_id': '9874567654', 'name': 'hari', 'Address': 'Chemmayi House', 'Adhar': '423650000965', 'phone': '1234568987','amount': 2500, 'image': 'fahad.PNG', 'status': 'pen'},
        {'pen_id': '7890123443', 'name': 'anjali', 'Address': 'oolappara House', 'Adhar': '123240345654', 'phone': '1234568987','amount': 2500, 'image': 'jaya.PNG', 'status': 'pen'},
        {'pen_id': '8438537647', 'name': 'akhifl', 'Address': 'asfgfdMaddi House', 'Adhar': '123456781234', 'phone': '1234568987','amount': 2500, 'image': 'prithvi.PNG', 'status': 'pen'},
        {'pen_id': '4567012357', 'name': 'deepawk', 'Address': 'Vattakuzhil House', 'Adhar': '178965478904', 'phone': '1234568987','amount': 2500, 'image': 'sachin.PNG', 'status': 'pen'},
        {'pen_id': '4567781234', 'name': 'harzi', 'Address': 'kujkiol House', 'Adhar': '423651478965', 'phone': '1234568987','amount': 2500, 'image': 'saniya.PNG', 'status': 'pen'},
        {'pen_id': '8788127890', 'name': 'anjaoli', 'Address': 'valapara House', 'Adhar': '123243598765', 'phone': '1234568987','amount': 2500, 'image': 'shredha.PNG', 'status': 'pen'},
      ];
//  List name1;
//  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Pension App' );
  int count = 0;
  TextStyle style3 = TextStyle(
    fontSize: 20,
    color: Colors.grey[400],
    fontWeight: FontWeight.bold,
  );
  TextStyle style2 = TextStyle(
    fontSize: 20,
    color: Colors.grey[400],
    fontWeight: FontWeight.bold,
  );
  TextStyle style1 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  Widget screen;
  int flag = 0;
  DBHelper dbHelper = DBHelper();
  var hhh1,hhh2,hhh3;

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          hhh1 = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
//    this._getNames();
//  setState(() {
//    filteredNames = names;
  print("init");
//  });
  dbHelper.createDatabase();
  super.initState();
  }

  Widget build(BuildContext context) {
    if(flag==0) {
      print("flag");
      var dd = dbHelper.retrival1();
      dd.then((hhh) {
        hhh1 = hhh;
      });
      screen = _buildList();
    }
    else if(flag==1) {
      var dd = dbHelper.retrival2();
      dd.then((hhh) {
        hhh2 = hhh;
      });
      screen = screen2();
    }
    else if(flag==2) {
      var dd = dbHelper.retrival3();
      dd.then((hhh) {
        hhh3=hhh;
      });
      screen = screen3();
    }
    return Scaffold(
      appBar: AppBar(
//      centerTitle: true,
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.white,
              onPressed: (){
                setState(() {

                });
              }
          ),
          PopupMenuButton(
            // ignore: missing_return
            itemBuilder: (BuildContext context) {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(30,40),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            flag = 0;
                            style1 = TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            );
                            style2 = TextStyle(
                              fontSize: 20,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            );
                            style3 = TextStyle(
                              fontSize: 20,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            );
                          });
                        },
                        child: Text("          Pending",
                          style: style1,
                        ),
                      )

                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        var dd = dbHelper.retrival2();
                        dd.then((hhh) {
                          hhh2 = hhh;
                          print(hhh2);
                          setState(() {
                            flag = 1;
                            style2 = TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            );
                            style1 = TextStyle(
                              fontSize: 20,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            );
                            style3 = TextStyle(
                              fontSize: 20,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            );
                          });
                        });
                      },
                      child: Text("         Given",
                        style: style2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          flag = 2;
                          style2 = TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          );
                          style1 = TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          );
                          style3 = TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          );
                        });
                      },
                      child: Text("     Death",
                        style: style3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: () async{
                    await dbHelper.insertion(names);
                    var dd = dbHelper.retrival1();
                    dd.then((hhh) {
                      hhh1 = hhh;
                      print(hhh1);
                      setState(() {

                      });
                    });//
                  },
                  color: Colors.blue,
                  child: Text("Insert"),
                ),
                RaisedButton(
                  onPressed: () async{
                    var employees1;
                    var yyy = dbHelper.retrival('akhil');
                    await yyy.then((asd) {
                      employees1 = asd;
                    });
                    var ff =Note(employees1[0]['id'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name'], employees1[0]['name']);
                    dbHelper.update(ff);
                    },
                  color: Colors.blue,
                  child: Text("Update"),
                ),
                RaisedButton(
                  child: Text("Delete"),
                  color: Colors.blue,
                  onPressed: () async{
                    await dbHelper.deleteNote();
                    var dd = dbHelper.retrival1();
                    dd.then((hhh) {
                      hhh1 = hhh;
                      print(hhh1);
                      setState(() {

                      });
                    });//
                  },
                ),
                RaisedButton(
                  child: Text("Retrival"),
                  color: Colors.blue,
                  onPressed: () {
                    dbHelper.retrivalful();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: screen,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildList() {
    count = 0;
    // ignore: prefer_is_not_empty
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < hhh1.length; i++) {
        if (hhh1[i]['name'].toLowerCase().contains(_searchText.toLowerCase()) || hhh1[i]['Address'].toLowerCase().contains(_searchText.toLowerCase()) || hhh1[i]['pen_id'].toLowerCase().contains(_searchText.toLowerCase()) || hhh1[i]['Adhar'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(hhh1[i]);
        }
      }
      hhh1 = tempList;
    }
    return ListView.builder(
        itemCount: hhh1 == null ? 0 : hhh1.length,
        itemBuilder: (BuildContext context, int index) {
          count += 1;
          var ss = hhh1[index]['image'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: Container(
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/$ss"),
                        ),
                      ),
//
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name: "+hhh1[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Address: "+hhh1[index]['Address'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Pen Id: "+hhh1[index]['pen_id'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Adhar No: "+hhh1[index]['Adhar'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Phone No: "+hhh1[index]['phone'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                          ],
                        ),
                      )),

                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Column(
                          children: <Widget>[
                            Text(count.toString()),
                            SizedBox(height: 22,),
                            Text(
                              "Amount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              hhh1[index]['amount'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  onTap: ()async{
//                    await dbHelper.insertion(names);
//                    await dbHelper.retrival();
                    var res = await Navigator.pushNamed(context, '/home', arguments: hhh1[index]['name']);
                    var dd = dbHelper.retrival1();
                    dd.then((hhh) {
                      hhh1 = hhh;
                      print(hhh1);
                      setState(() {

                      });
                    });//
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  Widget screen2(){
    count = 0;
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < hhh2.length; i++) {
        if (hhh2[i]['name'].toLowerCase().contains(_searchText.toLowerCase()) || hhh2[i]['Address'].toLowerCase().contains(_searchText.toLowerCase()) || hhh2[i]['pen_id'].toLowerCase().contains(_searchText.toLowerCase()) || hhh2[i]['Adhar'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(hhh2[i]);
        }
      }
      hhh2 = tempList;
    }
    return ListView.builder(
        itemCount: hhh2 == null ? 0 : hhh2.length,
        itemBuilder: (BuildContext context, int index) {
          count += 1;
          var ss = hhh2[index]['image'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: Container(
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/$ss"),
                        ),
                      ),
//
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name: "+hhh2[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Address: "+hhh2[index]['Address'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Pen Id: "+hhh2[index]['pen_id'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Adhar No: "+hhh2[index]['Adhar'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Phone No: "+hhh2[index]['phone'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                          ],
                        ),
                      )),

                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Column(
                          children: <Widget>[
                            Text(count.toString()),
                            SizedBox(height: 22,),
                            Text(
                              "Amount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              hhh2[index]['amount'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  onTap: (){
//                    await dbHelper.insertion(names);
//                    await dbHelper.retrival();
                    Navigator.pushNamed(context, '/home', arguments: hhh2[index]['name']);
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  Widget screen3(){
    count = 0;
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < hhh3.length; i++) {
        if (hhh3[i]['name'].toLowerCase().contains(_searchText.toLowerCase()) || hhh3[i]['Address'].toLowerCase().contains(_searchText.toLowerCase()) || hhh3[i]['pen_id'].toLowerCase().contains(_searchText.toLowerCase()) || hhh3[i]['Adhar'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(hhh3[i]);
        }
      }
      hhh3 = tempList;
    }
    return ListView.builder(
        itemCount: hhh3 == null ? 0 : hhh3.length,
        itemBuilder: (BuildContext context, int index) {
          count += 1;
          var ss = hhh3[index]['image'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: Container(
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/$ss"),
                        ),
                      ),
//
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name: "+hhh3[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Address: "+hhh3[index]['Address'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Pen Id: "+hhh3[index]['pen_id'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Adhar No: "+hhh3[index]['Adhar'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                            Text("Phone No: "+hhh3[index]['phone'],
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                          ],
                        ),
                      )),

                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Column(
                          children: <Widget>[
                            Text(count.toString()),
                            SizedBox(height: 22,),
                            Text(
                              "Amount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              hhh3[index]['amount'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  onTap: (){
//                    await dbHelper.insertion(names);
//                    await dbHelper.retrival();
                    Navigator.pushNamed(context, '/home', arguments: hhh3[index]['name']);
                  },
                ),
              ),
            ),
          );
        }
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            hintText: 'Search...',
            suffixIcon: new Icon(Icons.search),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Pension App' );
        //filteredNames = names;
        _filter.clear();
      }
    });
  }


}
