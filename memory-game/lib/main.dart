import 'package:flutter/material.dart';
import 'package:memorygame/pages/game.dart';
import 'package:memorygame/pages/levels.dart';
import 'package:memorygame/pages/start.dart';


void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/': (context) => Start(),
    '/levels': (context) => ChooseLevel(),
    '/game': (context) => Game(),
  },

));


