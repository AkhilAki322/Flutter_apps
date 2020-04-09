import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Datasearch());
            },
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
class Datasearch extends SearchDelegate<String>{
  final cities = [
    "qwerty",
    "asdfg",
    "zxcvb",
    "aserte",
    "poiuyt",
    "lkjhg",
    "mnbvc"
  ];
  final recentCities = [
    "qwerty",
    "asdfg",
    "zxcvb"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
      child: Card(
        color: Colors.blue,
        child: Center(
          child: Text(query),
        ),
    ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities.where((p) =>
        p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) =>
          ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]
                )
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
