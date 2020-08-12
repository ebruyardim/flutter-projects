import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String url;
  String flag;
  bool isDay;

  WorldTime({this.url,this.flag,this.location});

  Future<void> getTime() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      if (data['utc_offset'][0] == '-'){
        now = now.subtract(Duration(hours: int.parse(offset)));
      }
      else{
        now = now.add(Duration(hours: int.parse(offset)));
      }


      isDay = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }
    catch (e){
      time = 'error';
    }



  }

}