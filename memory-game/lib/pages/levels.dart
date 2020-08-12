import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memorygame/pages/game.dart';

class ChooseLevel extends StatefulWidget {
  @override
  _chooseLevelState createState() => _chooseLevelState();
}

class _chooseLevelState extends State<ChooseLevel> {

  int dataSize(level){
    int dataSize;
    if (level == 1) dataSize = 12;
    else if (level == 2) dataSize = 16;
    else if (level == 3) dataSize = 18;
    else if (level == 4) dataSize = 20;
    else if (level == 5) dataSize = 24;
    return dataSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text('Level'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amberAccent[100],
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 3.5,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/game',arguments: {'level': index+1,'dataSize': dataSize(index+1),},);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'LEVEL ${index+1}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          })
        ),
      ),
    );
  }
}
