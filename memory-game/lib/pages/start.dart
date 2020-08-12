import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 150.0,),
            Text(
              'Memory Game',
              style: TextStyle(
                fontSize: 70.0,
                letterSpacing: 4.0,
                color: Colors.amber[400],
                fontFamily: 'PermanentMarker',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 120.0),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/levels');
              },
              color: Colors.amber[500],
              child: Text(
                'START',
                style: TextStyle(fontSize: 20.0,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
