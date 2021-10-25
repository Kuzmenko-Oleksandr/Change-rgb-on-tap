import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainWidget();
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  Color mainColor = Colors.white;
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _rgb() {
    mainColor = Color.fromRGBO(Random().nextInt(254) + 1,
        Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test application',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          color: Color(0xFF151026),
        )),
        home: Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
            title: const Text('Tap anywhere', style: TextStyle(fontSize: 45.0)),
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent, //or HitTestBehavior.opaque
            onTap: () {
              setState(() {
                _increment();
                _rgb();
              });
            },
            child: Center(
              child: Text(
                  'Hey there' +
                      '\nnumbers of tap $counter' +
                      "\nNow $mainColor",
                  style: const TextStyle(fontSize: 32.0)),
            ),
          ),
        ));
  }
}
