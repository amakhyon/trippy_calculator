import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_calculator/myWidgets/numberButton.dart';
import 'package:my_calculator/Controllers/operations_temp.dart';
import 'package:my_calculator/Controllers/arithmetic_operations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.blue;

  @override
  void initState() {
    super.initState();

    // Start a timer to change the color every 2 seconds
    Timer.periodic(Duration(seconds: 6), (timer) {
      setState(() {
        _currentColor = _currentColor == Colors.pink  ? Colors.lightBlueAccent : Colors.pink ;
      });
    });
  }

  void updateScreen(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: [
              Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 4),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.only(top:30,left:15,right:15),
                      color: _currentColor,
                      width:double.infinity,
                      height:370,
                      child: Center(
                          child: Text(
                            style: TextStyle(
                                fontSize: 70
                            ),
                            screen_display,
                          )
                      ),
                    ),
                  ), //screen

                ],
              ), //screen

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  NumberButton('C', _currentColor, (){this.updateScreen();},380),

                ],
              ), // Cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  NumberButton('7', _currentColor, (){this.updateScreen();},80),
                  NumberButton('8', _currentColor, (){ this.updateScreen();},80),
                  NumberButton('9', _currentColor, (){this.updateScreen();},80),
                  NumberButton('+', _currentColor, (){ this.updateScreen();},80),



                ],
              ), // first row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  NumberButton('4', _currentColor, (){this.updateScreen();},80),
                  NumberButton('5', _currentColor, (){this.updateScreen();},80),
                  NumberButton('6', _currentColor, (){this.updateScreen();},80),
                  NumberButton('-', _currentColor, (){this.updateScreen();},80),



                ],
              ), // second row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  NumberButton('1',_currentColor, (){this.updateScreen();},80),
                  NumberButton('2', _currentColor, (){this.updateScreen();},80),
                  NumberButton('3', _currentColor, (){this.updateScreen();},80),
                  NumberButton('X', _currentColor, (){this.updateScreen();},80),



                ],
              ), // third row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  NumberButton('=', _currentColor, (){this.updateScreen();},180),
                  NumberButton('0', _currentColor, (){this.updateScreen();},80),
                  NumberButton('/', _currentColor, (){this.updateScreen();},80),



                ],
              ), // fourth row

              // Expanded(child:Row(children:[])),
              // Expanded(child:Row(children:[])),

            ],
          ),
        ),
      ),
    );
  }
}
