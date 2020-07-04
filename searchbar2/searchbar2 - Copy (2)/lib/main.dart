import 'package:flutter/material.dart';
import 'screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        '/home': (context) => screen11(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Api Filter list Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ExamplePage(),
    );
  }
}

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
  List names;
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );
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

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
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
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    if(flag==0)
      screen = _buildList();
    else if(flag==1)
        screen = screen2();
    else if(flag==2)
      screen = screen3();
    return Scaffold(
      appBar: _buildBar(context),
      drawer: Drawer(),
      body: Container(
        child: screen,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    count =0;
    return new AppBar(
//      centerTitle: true,
      title: _appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
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
    );
  }

  Widget _buildList() {
    // ignore: prefer_is_not_empty
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase()) || filteredNames[i]['Address'].toLowerCase().contains(_searchText.toLowerCase()) || filteredNames[i]['pen_id'].toLowerCase().contains(_searchText.toLowerCase()) || filteredNames[i]['Adhar'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        count += 1;
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
                        backgroundImage: AssetImage("images/download.jpg"),
                      ),
                    ),
//
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "Name: "+filteredNames[index]['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Address: "+filteredNames[index]['Address'],
                            style: TextStyle(
                              fontSize: 17,
                            ),),
                          Text("Pen Id: "+filteredNames[index]['pen_id'],
                            style: TextStyle(
                              fontSize: 17,
                            ),),
                          Text("Adhar No: "+filteredNames[index]['Adhar'],
                            style: TextStyle(
                              fontSize: 17,
                            ),),
                          Text("Phone No: "+filteredNames[index]['phone'],
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
                            filteredNames[index]['amount'].toString(),
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
                onTap: () {
                  print(filteredNames[index]['name']);
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ),
        );
      }
    );
  }
  Widget screen2(){
    return Container(
      child: Text("Screen 2"),
    );
  }
  Widget screen3(){
    return Container(
      child: Text("Screen 3"),
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
        this._appBarTitle = new Text( 'Search Example' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() async {
//    final response = await dio.get('https://swapi.co/api/people');
//    List tempList = new List();
//    for (int i = 0; i < response.data['results'].length; i++) {
//      tempList.add(response.data['results'][i]);
//    }
    setState(() {
//      names = tempList;
//      names.shuffle();
//      filteredNames = names;
      names = [
        {'pen_id': '1234567890', 'name': 'akhil', 'Address': 'Madathodi House', 'Adhar': '123456781234', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1232331345', 'name': 'deepak', 'Address': 'Vattaparambil House', 'Adhar': '114555478904', 'phone': '1234568987','amount': 2500},
        {'pen_id': '9874567654', 'name': 'hari', 'Address': 'Chemmayi House', 'Adhar': '423650000965', 'phone': '1234568987','amount': 2500},
        {'pen_id': '7890123443', 'name': 'anjali', 'Address': 'oolappara House', 'Adhar': '123240345654', 'phone': '1234568987','amount': 2500},
        {'pen_id': '8438537647', 'name': 'akhifl', 'Address': 'asfgfdMaddi House', 'Adhar': '123456781234', 'phone': '1234568987','amount': 2500},
        {'pen_id': '4567012357', 'name': 'deepawk', 'Address': 'Vattakuzhil House', 'Adhar': '178965478904', 'phone': '1234568987','amount': 2500},
        {'pen_id': '4567781234', 'name': 'harzi', 'Address': 'kujkiol House', 'Adhar': '423651478965', 'phone': '1234568987','amount': 2500},
        {'pen_id': '8788127890', 'name': 'anjaoli', 'Address': 'valapara House', 'Adhar': '123243598765', 'phone': '1234568987','amount': 2500},
      ];
      filteredNames = names;
    });
  }


}
