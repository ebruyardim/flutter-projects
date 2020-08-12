
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    //print(data);

    String bgPic = data['isDay'] ? 'dayTime.jpg' : 'nightTime.jpg';
    Color bgColor = data['isDay'] ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgPic'),
                fit: BoxFit.fill,
              )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'flag': result['flag'],
                          'location': result['location'],
                          'isDay': result['isDay']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location,color: Colors.grey[400]),
                    label: Text("Choose Location",style: TextStyle(letterSpacing: 2.0,color: Colors.grey[400]),),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Text(
                  data['time'],
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60.0,color: Colors.white),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
