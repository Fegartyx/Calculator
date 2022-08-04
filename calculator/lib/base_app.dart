import 'package:calculator/style.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class BaseApp extends StatefulWidget {
  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPress(String text) {
    setState(() {
      if (text == "C") {
        equation = "0";
        result = "0";
      } else if (text == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
          debugPrint("Error $e");
        }
      } else {
        equation == '0' ? equation = text : equation = equation + text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var platformBrightness = MediaQuery.of(context).platformBrightness;
    Widget button(String text) {
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.012),
        height: MediaQuery.of(context).size.height * 0.09,
        child: FloatingActionButton(
          heroTag: null,
          backgroundColor: bgColor1,
          splashColor: Colors.grey,
          onPressed: () {
            buttonPress(text);
          },
          child: Text(
            text,
            style: clearTextStyle.copyWith(fontSize: 36),
          ),
        ),
      );
    }

    Widget app() {
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                equation,
                style: primaryTextStyle.copyWith(fontSize: 48),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                result,
                style: secondaryTextStyle.copyWith(fontSize: 48),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12, left: 12, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.history),
                    color: secondaryTextColor,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.backspace_outlined),
                    color: secondaryTextColor,
                    onPressed: () {
                      setState(() {
                        equation = equation.substring(0, equation.length - 1);
                        if (equation == "") {
                          equation = "0";
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                color: primaryTextColor,
                thickness: 1,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: 21, right: 11, bottom: 15, top: 12),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            button("C"),
                            button("%"),
                            button("÷"),
                            button("÷"),
                          ],
                        ),
                        TableRow(
                          children: [
                            button("7"),
                            button("8"),
                            button("9"),
                            button("x"),
                          ],
                        ),
                        TableRow(
                          children: [
                            button("4"),
                            button("5"),
                            button("6"),
                            button("-"),
                          ],
                        ),
                        TableRow(
                          children: [
                            button("1"),
                            button("2"),
                            button("3"),
                            button("+"),
                          ],
                        ),
                        TableRow(
                          children: [
                            button("+/-"),
                            button("0"),
                            button("."),
                            button("="),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor:
          platformBrightness == Brightness.light ? bgColor1 : bgColor2,
      body: app(),
    );
  }
}
