import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Ankara', url: 'Europe/Istanbul', flag: 'turkey.jpg'),
    WorldTime(location: 'Baku', url: 'Asia/Baku', flag: 'azerbaycan.png'),
    WorldTime(location: 'Fiji', url: 'Pacific/Fiji', flag: 'fiji.jpg'),
    WorldTime(location: 'Jakarta', url: 'Asia/Jakarta', flag: 'endonezya.jpg'),
    WorldTime(location: 'Kiev', url: 'Europe/Kiev', flag: 'ukraine.jpg'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'england.png'),
    WorldTime(location: 'Luxembourg', url: 'Europe/Luxembourg', flag: 'luxembourg.jpg'),
    WorldTime(location: 'Madrid', url: 'Europe/Madrid', flag: 'spain.png'),
    WorldTime(location: 'Moscow', url: 'Europe/Moscow', flag: 'russia.png'),
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'america.jpg'),
    WorldTime(location: 'Rome', url: 'Europe/Rome', flag: 'italy.jpg'),
    WorldTime(location: 'Seoul', url: 'Asia/Seoul', flag: 'korea.jpg'),
    WorldTime(location: 'Stockholm', url: 'Europe/Stockholm', flag: 'sweden.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
           return Card (
             child: ListTile(
               onTap: (){
                updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           );
          }
      ),
    );
  }
}

