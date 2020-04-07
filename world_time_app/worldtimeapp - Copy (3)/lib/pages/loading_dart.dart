import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getData();
    setState(() {
      time = instance.time;
    });
  }


  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Text(time),
      ),
    );
  }
}
