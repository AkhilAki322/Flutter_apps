import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
ProgressDialog pr;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.amberAccent,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Alert(),
        drawer: MainDrawer(),
      ),
    );
  }
}
class Alert extends StatelessWidget {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Download);

    pr.style(
      message: 'Downloading file...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.amberAccent,
            child: Text(
              "Click Here",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          RaisedButton(
            color: Colors.amberAccent,
            child: Text(
              "Click Here2",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Fluttertoast.showToast(
                msg: "qwertyu",
                fontSize: 30,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.black,
                toastLength: Toast.LENGTH_LONG,
              );            },
          ),
          FlatButton(
            child: Text("Click Me"),
            color: Colors.red,
            onPressed: () {
              pr.show();
              Future.delayed(Duration(seconds: 2)).then((onvalue) {
                percentage = percentage + 30.0;
                print(percentage);

                pr.update(
                  progress: percentage,
                  message: "Please wait...",
                  progressWidget: Container(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator()),
                  maxProgress: 100.0,
                  progressTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  messageTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600),
                );
                Future.delayed(Duration(seconds: 2)).then((value) {
                  percentage = percentage + 30.0;
                  pr.update(
                      progress: percentage, message: "Few more seconds...");
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    percentage = percentage + 30.0;
                    pr.update(progress: percentage, message: "Almost done...");
                    Future.delayed(Duration(seconds: 2)).then((value) {
                      pr.hide().whenComplete(() {
                        print(pr.isShowing());
                      });
                      percentage = 0.0;
                    });
                  });
                }
                );
              }
              );
            }
          )
        ]
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  print(context);
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },

  );
}