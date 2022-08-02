import 'package:calculator/style.dart';
import 'package:flutter/material.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button(String text) {
      return Container(
        margin: EdgeInsets.only(bottom: 25),
        height: MediaQuery.of(context).size.height * 0.09,
        child: FloatingActionButton(
          backgroundColor: bgColor1,
          splashColor: Colors.grey,
          onPressed: () {},
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
              padding: EdgeInsets.only(top: 40),
              child: Text(
                '2 + 7',
                style: primaryTextStyle.copyWith(fontSize: 48),
              ),
            ),
            SizedBox(
              height: 88,
            ),
            Container(
              child: Text(
                '9',
                style: secondaryTextStyle.copyWith(fontSize: 48),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12, left: 12, top: 20),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: primaryTextColor,
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: 21, right: 11, top: 22, bottom: 43),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            button('C'),
                            button('()'),
                            button('%'),
                            button('÷'),
                          ],
                        ),
                        TableRow(
                          children: [
                            button('7'),
                            button('8'),
                            button('9'),
                            button('x'),
                          ],
                        ),
                        TableRow(
                          children: [
                            button('4'),
                            button('5'),
                            button('6'),
                            button('-'),
                          ],
                        ),
                        TableRow(
                          children: [
                            button('1'),
                            button('2'),
                            button('3'),
                            button('+'),
                          ],
                        ),
                        TableRow(
                          children: [
                            button('+/-'),
                            button('0'),
                            button('.'),
                            button('='),
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
      backgroundColor: bgColor1,
      body: app(),
    );
  }
}
