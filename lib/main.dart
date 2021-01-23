//lib ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

import 'package:flutter/material.dart';

// main +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void main() {
  runApp(MyCalculator());
}

// Stateless Widgets +++++++++++++++++++++++++++++++++++++++++++++++++++++
class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Calculator(),
      title: "",
    );
  }
}

// Stateful Widgets ++++++++++++++++++++++++++++++++++++++++++++++++++++

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = "0";
  double numOne = 0;
  double numtwo = 0;

  String result = "0";
  String finalresult = "0";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "$text",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("C", Color(0xffa5a5a5)),
                buttonStyle("+/-", Color(0xffa5a5a5)),
                buttonStyle("%", Color(0xffa5a5a5)),
                buttonStyle("/", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("7", Color(0xff323232)),
                buttonStyle("8", Color(0xff323232)),
                buttonStyle("9", Color(0xff323232)),
                buttonStyle("X", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("6", Color(0xff323232)),
                buttonStyle("5", Color(0xff323232)),
                buttonStyle("4", Color(0xff323232)),
                buttonStyle("-", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("3", Color(0xff323232)),
                buttonStyle("2", Color(0xff323232)),
                buttonStyle("1", Color(0xff323232)),
                buttonStyle("+", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("0", Color(0xffa5a5a5), 0),
                buttonStyle(".", Color(0xffa5a5a5)),
                buttonStyle("=", Color(0xffff9800)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonStyle(String btnText, Color color, [int num]) {
    var container;
    if (num == 0) {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {},
            child: Text(btnText, style: TextStyle(fontSize: 30)),
            color: color,
            padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
            shape: StadiumBorder(),
          ));
    } else {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              btnText,
              style: TextStyle(fontSize: 30),
            ),
            color: color,
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
          ));
    }
    return container;
  }
}
