import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Body Utilities'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int time = 0;
  Timer _timer;

  void _startTimer() {
    if(_timer == null || !_timer.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          time += 1;
        });
      });
    }
  }

  void _stopTimer() {
    if(_timer != null) {
      _timer.cancel();
    }
  }

  void _refreshTimer() {
    _stopTimer();
    setState(() {
      time = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25.0),
              child: Text(
                '$time',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(side: BorderSide(color: Colors.black)), 
                      color: Colors.white
                    ),
                    child: IconButton(
                      icon: Icon(Icons.play_arrow), 
                      onPressed: _startTimer
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(side: BorderSide(color: Colors.black)), 
                      color: Colors.white
                    ),
                    child: IconButton(
                      icon: Icon(Icons.pause), 
                      onPressed: _stopTimer
                      ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(side: BorderSide(color: Colors.black)), 
                      color: Colors.white
                    ),
                    child: IconButton(
                      icon: Icon(Icons.refresh), 
                      onPressed: _refreshTimer
                      )
                  ),
                ),
              ],
            )           
          ],
        ),
      ), 
    );
  }
}
