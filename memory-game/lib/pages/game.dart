import 'package:flutter/material.dart';
import 'package:memorygame/templates/game_template.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {

    final Map map = ModalRoute.of(context).settings.arguments;
    int level = map['level'];
    int dataSize = map['dataSize'];
    return GameTemplate(level: level,dataSize: dataSize,);
  }
}





