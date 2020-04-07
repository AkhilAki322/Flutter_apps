import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New_york', flag: 'germany.png', url: 'America/New_york'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isdaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: location.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}
