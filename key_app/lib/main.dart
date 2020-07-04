import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: InputBox(),
));

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool loggedIn = false;
  String _email, _username, _password;
  final formkey = GlobalKey<FormState>();
  final mainkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: loggedIn == false ? Form(
          key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: "Email: "
                  ),
                  validator: (str)  => !str.contains('@') ? "Not a valid email" : null,
                  onSaved: (str) => _email = str,
                ),
                TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      labelText: "Username: "
                  ),
                  validator: (str)  => str.length <= 5 ? "Not a valid username" : null,
                  onSaved: (str) => _username = str,
                ),
                TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      labelText: "Password: "
                  ),
                  validator: (str)  => str.length <= 7 ? "Not a valid Password" : null,
                  onSaved: (str) => _password = str,
                  obscureText: true,
                ),
                RaisedButton(
                    onPressed: onPressed,
                  child: Text("Submit"),
                ),
              ],
            )
        ) : Center(
          child: Column(
            children: <Widget>[
              Text("Welcome $_username"),
              RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  setState(() {
                    loggedIn = false;
                  });
                },
              ),
            ],
          ),
        )


      ),
    );
  }
  void onPressed() {
    var form = formkey.currentState;
    if(form.validate()){
      form.save();
      setState(() {
        loggedIn = true;
      });
    }
  }
}
