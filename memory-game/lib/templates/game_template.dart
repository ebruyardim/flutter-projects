import 'package:flutter/material.dart';
import 'package:memorygame/data/data.dart';

class GameTemplate extends StatefulWidget {
  final int level,dataSize;
  GameTemplate({this.level,this.dataSize});
  @override
  GameTemplateState createState() => GameTemplateState(level: level,dataSize: dataSize);
}

class GameTemplateState extends State<GameTemplate> {

  List<Data> bigData = [
    Data(front: 'assets/a.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/a.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/b.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/b.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/c.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/c.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/d.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/d.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/e.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/e.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/f.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/f.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/g.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/g.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/h.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/h.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/i.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/i.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/j.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/j.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/k.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/k.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/l.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/l.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/m.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/m.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/n.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/n.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/o.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/o.jpg', back: 'assets/flower.jpg', clickable: true),
    Data(front: 'assets/p.jpg', back: 'assets/flower.jpg', clickable: true), Data(front: 'assets/p.jpg', back: 'assets/flower.jpg', clickable: true),
  ];

  List<GestureDetector> myList;
  List<Data> data;

  int eyeCount;
  int level;
  int dataSize;
  GameTemplateState({this.level,this.dataSize});
  Image image;
  int control = 100;
  bool clickable = false;
  int found=0;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink[50],
          title: Center(child: Text('Congrulations!')),
          content: Text('Tap to button...'),
          actions: <Widget>[
            RaisedButton(
              color: Colors.white,
              child: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/levels'));
              },
            ),
          ],
        );
      },
    );
  }
  void checkComplete(){
    if (found==dataSize/2){
      _showMyDialog();
    }
  }

  void setEyeCount(){
    setState(() {
      if (level==1 || level==3){
        eyeCount = 3;
      }
      else{
        eyeCount = 4;
      }
    });
  }

  int height(){
    int height;
    if (level==1) height=150;
    else if (level==2) height=150;
    else if (level==3) height=100;
    else if (level==4) height=120;
    else if (level==5) height=100;
    return height;
  }

  List<Data> createData(size){
    data = bigData.sublist(0,size);
    return data;
  }

  void checkPair(index) async {
    if (control == 100){ // first choose
      setState(() {
        control = index;
      });
      turnImage(index);
    }
    else{
      if (data[control].front == data[index].back){ // if pair
        setState(() {
          found++;
          checkComplete();
        });
        await pair(index);

      }
      else{ // not pair
        await notPair(index);
      }
    }
  }

  Future<void> notPair(index) async {
    turnImage(index);
    clickable = false;
    await Future.delayed(const Duration(seconds: 1), (){
      turnImage(index);
      turnImage(control);
      clickable = true;
      setState(() {
        control = 100;
      });
    });
  }

  Future<void> pair(index) async {
    turnImage(index);
    data[control].clickable = false;
    data[index].clickable = false;
    clickable = false;
    await Future.delayed(const Duration(milliseconds: 1), (){
      clickable = true;
      setState(() {
        control = 100;
      });
    });
  }

  void turnImage(index) {
    if (data[index].front == 'assets/flower.jpg') {
      data[index].front = data[index].back;
      data[index].back = 'assets/flower.jpg';
    }
    else{
      data[index].back = data[index].front;
      data[index].front = 'assets/flower.jpg';
    }
  }

  Image showImage(index)  {
    setState(() {
      image = Image.asset(data[index].front);
    });
    return image;
  }

  Future<void> startingShow() async {
    await Future.delayed(const Duration(seconds: 3), (){});
    setState(() {
      clickable = true;
      for (int i=0;i<data.length;i++){
        data[i].back = data[i].front;
        data[i].front = 'assets/flower.jpg';
      }
    });
  }

  @override
  void initState() {
    setEyeCount();
    data = createData(dataSize);
    data.shuffle();
    startingShow();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width/eyeCount;
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $level'),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
      ),
      body: Container(
          color: Colors.blueGrey[400],
          child: GridView.count(
            crossAxisCount: eyeCount,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0.5,
            childAspectRatio: screenWidth/height(),
            children: myList = List<GestureDetector>.generate(data.length, (index) {
              return GestureDetector(
                onTap: (){
                  if (data[index].clickable && clickable){
                    setState(() {
                      checkPair(index);
                    });
                  }
                },
                child: Card(
                  color: Colors.white,
                  child: showImage(index),
                ),
              );
            }),
          )
      ),
    );
  }
}
