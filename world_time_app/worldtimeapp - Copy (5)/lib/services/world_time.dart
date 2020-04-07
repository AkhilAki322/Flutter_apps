import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isdaytime;

  WorldTime({this.location, this.flag, this.url});

 Future<void> getData() async {

   try {
     Response response = await get("http://worldtimeapi.org/api/timezone/$url");
     //print(response.body);
     Map data = jsonDecode(response.body);
     //print(data);
     //print(data['title']);
     String datetime =  data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
     String offset1 = data['utc_offset'].substring(4,6);
//    print(datetime);
//    print(offset);
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     now = now.add(Duration(minutes: int.parse(offset1)));
//    print(offset);
//     print(offset1);
//     time = now.toString();
     isdaytime = now.hour > 06 &&  now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
   }
   catch (e) {
      print('caugth error: $e');
      time = 'could not get the time data';
   }


  }
}