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

  String opr = "";
  String preopr = "";

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
                buttonStyle("4", Color(0xff323232)),
                buttonStyle("5", Color(0xff323232)),
                buttonStyle("6", Color(0xff323232)),
                buttonStyle("-", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("1", Color(0xff323232)),
                buttonStyle("2", Color(0xff323232)),
                buttonStyle("3", Color(0xff323232)),
                buttonStyle("+", Color(0xffff9800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonStyle("0", Color(0xff323232), 0),
                buttonStyle(".", Color(0xff323232)),
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
            onPressed: () {
              Calculate(btnText);
            },
            child: Text(btnText, style: TextStyle(fontSize: 30)),
            color: color,
            padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
            shape: StadiumBorder(),
          ));
    } else {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
              Calculate(btnText);
            },
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

  void Calculate(String txtbtn) {
    if (txtbtn == "C") {
      text = "0";
      numOne = 0;
      numtwo = 0;
      result = "";
      finalresult = "0";
      opr = "";
      preopr = "";
    } else if (opr == '=' && txtbtn == '=') {
      switch (preopr) {
        case "+":
          finalresult = add();
          break;
        case "-":
          finalresult = sub();
          break;
        case "X":
          finalresult = mult();
          break;
        case "/":
          finalresult = div();
          break;
      }
    } else if (txtbtn == '+' ||
        txtbtn == '-' ||
        txtbtn == 'X' ||
        txtbtn == '/' ||
        txtbtn == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numtwo = double.parse(result);
      }

      switch (opr) {
        case "+":
          finalresult = add();
          break;
        case "-":
          finalresult = sub();
          break;
        case "X":
          finalresult = mult();
          break;
        case "/":
          finalresult = div();
          break;
      }

      preopr = opr;
      opr = txtbtn;
      result = "";
    } else if (txtbtn == "%") {
      result = "${numOne / 100}";
      finalresult = result;
    } else if (txtbtn == '.') {
      if (!result.contains(".")) {
        result += '.';
        finalresult = result;
      }
    } else if (txtbtn == '+/-') {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
      finalresult = result;
    } else {
      if (result == "0") {
        result = txtbtn;
      } else {
        result = result + txtbtn;
        finalresult = result;
      }
    }

    setState(() {
      text = finalresult;
    });
  }

  String add() {
    result = (numOne + numtwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String sub() {
    result = (numOne - numtwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String mult() {
    result = (numOne * numtwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String div() {
    result = (numOne / numtwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String decimalRemove(String _result) {
    if (_result.contains(".")) {
      List<String> split = _result.split(".");
      if (!(int.parse(split[1]) > 0)) {
        return split[0];
      }
    }
    return _result;
  }
}
