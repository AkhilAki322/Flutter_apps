import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
  List names = [
    {'name': 'akhil'}
  ];
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );

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
    return Scaffold(
      appBar: _buildBar(context),
      drawer: Drawer(),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
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
    );
  }

  Widget _buildList() {
    // ignore: prefer_is_not_empty
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
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
                },
              ),
            ),
          ),
        );
      }
    );
  }

//            child: ListTile(
//              onTap: () {
//                print(filteredNames[index]['name']);
//              },
//              title: Text(filteredNames[index]['name']),
//              subtitle: Text(filteredNames[index]['age']),
//              leading: CircleAvatar(
//                backgroundImage: AssetImage('images/download.jpg'),
//              ),
//            ),


//        return new ListTile(
//          title: Text(filteredNames[index]['name']),
//          subtitle: Text(filteredNames[index]['age']),
//          onTap: () => print(filteredNames[index]['name']),
//        );


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
        {'pen_id': '1234567890', 'name': 'deepak', 'Address': 'Vattaparambil House', 'Adhar': '178965478904', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'hari', 'Address': 'Chemmayi House', 'Adhar': '423651478965', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'anjali', 'Address': 'oolappara House', 'Adhar': '123240987654', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'akhil', 'Address': 'Madathodi House', 'Adhar': '123456781234', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'deepak', 'Address': 'Vattaparambil House', 'Adhar': '178965478904', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'hari', 'Address': 'Chemmayi House', 'Adhar': '423651478965', 'phone': '1234568987','amount': 2500},
        {'pen_id': '1234567890', 'name': 'anjali', 'Address': 'oolappara House', 'Adhar': '123240987654', 'phone': '1234568987','amount': 2500},
      ];
      filteredNames = names;
      print(names);
    });
  }


}
