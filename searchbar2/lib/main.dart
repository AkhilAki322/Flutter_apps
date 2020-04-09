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
            child: ListTile(
              onTap: () {
                print(filteredNames[index]['name']);
              },
              title: Text(filteredNames[index]['name']),
              subtitle: Text(filteredNames[index]['age']),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/download.jpg'),
              ),
            ),
          ),
        );
//        return new ListTile(
//          title: Text(filteredNames[index]['name']),
//          subtitle: Text(filteredNames[index]['age']),
//          onTap: () => print(filteredNames[index]['name']),
//        );
      },
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
        {'name': 'akhil', 'age': '21'},
        {'name': 'deepak', 'age': '23'},
        {'name': 'hari', 'age': '20'},
        {'name': 'anjali', 'age': '19'},
      ];
      filteredNames = names;
      print(names);
    });
  }


}
