import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData isLight = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);
ThemeData isDark = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent),
);

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool switchVal = false;
  Color backcolor = Colors.white;
  Color numColor = Colors.black;
  String answer = '0';
  String res = '';
  String history = ' ';
  String operation = ' ';
  String showOn = '=';
  int a = 0;
  int b = 0;

  void touchButton(String buttonVal) {
    if (buttonVal == '0') {
      setState(() {
        answer = '0';
        history = '';
      });
      a = 0;
      b = 0;
      res = '0';
    } else if (buttonVal == '+' ||
        buttonVal == '-' ||
        buttonVal == 'x' ||
        buttonVal == '/' ||
        buttonVal == '+/-' ||
        buttonVal == '/00') {
      a = int.parse(answer);
      operation = buttonVal;
      showOn = answer;
      res = '';
      // history = history.toString() + ' ' + operation.toString() = '';
    } else if (buttonVal == '=') {
      b = int.parse(answer);
      if(operation == '+'){
        res = (a+b).toString();
      }else if (operation == '-'){
        res = (a-b).toString();
      }else if (operation == 'x'){
        res = (a/b).toString();
      }else if (operation == '+/-'){
        res = (a+-b).toString();
      }
      if (operation == '+/-'){
        if(answer[0] != '-'){
          // res = '0' = answer;
        }else {
          res = answer.substring(1);
        }
      }
    }

    Widget Touch(String btnVal, Color txtClr) {
      return GestureDetector(
        onTap: () => touchButton(btnVal),
        child: Container(
          child: Text(
            btnVal,
            style: TextStyle(fontSize: 35, color: txtClr),
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      );
    }
  }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: isLight,
        darkTheme: isDark,
        themeMode: (switchVal) ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          backgroundColor: backcolor,
          body: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Transform.scale(
                  scale: 1.2,
                  child: Switch(
                    value: switchVal,
                    onChanged: (val) {
                      setState(() {
                        switchVal = val;
                        (switchVal)
                            ? backcolor = Colors.black
                            : backcolor = Colors.white;
                        (switchVal)
                            ? numColor = Colors.white
                            : numColor = Colors.black;
                      });
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: 440,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Touch(
                    //       '0',
                    //       (switchVal) ? Colors.teal : Colors.black,
                    //     ),
                    //     Touch(
                    //       '+/-',
                    //       (switchVal) ? Colors.teal : Colors.black,
                    //     ),
                    //     Touch(
                    //       '/00',
                    //       (switchVal) ? Colors.teal : Colors.black,
                    //     ),
                    //     Touch(
                    //       '/',
                    //       (switchVal) ? Colors.teal : Colors.black,
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }





