import 'dart:math';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var lImage = 1;
  var rImage = 2;
  void genrateRanImage() {
    setState(() {
      lImage = Random().nextInt(6) + 1;
      rImage = Random().nextInt(6) + 1;
      if (lImage == rImage) {
        Toast.show("Lucky YOU", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                genrateRanImage();
              },
              child: Image.asset('images/dice$lImage.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                genrateRanImage();
              },
              child: Image.asset('images/dice$rImage.png'),
            ),
          ),
        ],
      ),
    );
  }
}
