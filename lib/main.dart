import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'widgets/CalcButton.dart';
import 'constants.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  //default empty feilds.
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(backgroundColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment(1, 1),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24.0,
                    color: Color(lightGreyColor),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment(1, 1),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: 'AC',
                  textColor: defaultTextColor,
                  fillColor: lightGreyColor,
                  textSize: 20.0,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  textColor: defaultTextColor,
                  fillColor: lightGreyColor,
                  textSize: 20.0,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '7',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: 'X',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '4',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: 38.0,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '1',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: 38.0,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '.',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '00',
                  textColor: defaultTextColor,
                  fillColor: transparentColor,
                  textSize: defaultTextSize,
                  callback: numClick,
                ),
                CalcButton(
                  text: '=',
                  textColor: defaultTextColor,
                  fillColor: whiteColor,
                  textSize: 30.0,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
