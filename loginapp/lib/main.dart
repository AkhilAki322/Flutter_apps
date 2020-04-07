import 'package:flutter/material.dart';
import 'package:loginapp/main_drawer.dart';
import 'settings.dart';
import 'login.dart';
import 'main_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  String _title = "Please Login";
  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  _MyAppState() {
    _login = login(onSubmit: () {onSubmit();});

    _settings = settings();
    _screen = _login;
    _authenticated = false;
    print("first");
  }

  void onSubmit() {
    print("login with: " + _login.username + ' ' + _login.password);
    if(_login.username == "akhil" && _login.password == "akhil"){
      _setAuthenticate(true);
    }
  }
  void _goHome() {
    print("home");
    setState(() {
      if(_authenticated == true) {
        _screen = _settings;
      }
      else {
        _screen = _login;
        _title = "Please Login2";
      }
    });
  }
  void _logout() {
    print("logout");
    _setAuthenticate(false);
  }
  void _setAuthenticate(bool auth) {
    setState(() {
      if(auth == true) {
        _screen = _settings;
        _title = "welcome";
      }
      else {
        _screen = _login;
        _title = "Please Login1";
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.home
              ),
              onPressed: () {
                _goHome();
              },
            ),
            IconButton(
              icon: Icon(
                  Icons.exit_to_app
              ),
              onPressed: () {
                _logout();
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: _screen,
      ),
    );
  }
}
