import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

 Future<void> getData() async {

   try {
     Response response = await get("http://worldtimeapi.org/api/timezones/$url");
     //print(response.body);
     Map data = jsonDecode(response.body);
     //print(data);
     //print(data['title']);
     String datetime =  data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
//    print(datetime);
//    print(offset);
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
//    print(now);
     time = now.toString();
   }
   catch (e) {
      print('caugth error: $e');
      time = 'could not get the time data';
   }


  }
}