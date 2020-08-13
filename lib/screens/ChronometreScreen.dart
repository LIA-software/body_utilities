import 'package:flutter/material.dart';
import 'dart:async';

class ChronometreScreen extends StatefulWidget {
  @override
  _ChronometreScreenState createState() => _ChronometreScreenState();
}

class _ChronometreScreenState extends State<ChronometreScreen> {
  String _time = "00:00:00";

  Stopwatch _stopwatch = Stopwatch();

  bool _timerActive = false;

  void _startTimer() {
    Timer(Duration(milliseconds: 30), callback);
  }

  void callback() {
    if (_stopwatch.isRunning) {
      _startTimer();
    }
    setState(() {
      _time = (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") +
          ":" +
          (_stopwatch.elapsed.inMilliseconds % 60).toString().padLeft(2, "0");
    });
  }

  void _startChrono() {
    setState(() {
      _timerActive = true;
    });
    _stopwatch.start();
    _startTimer();
  }

  void _stopChrono() {
    setState(() {
      _timerActive = false;
    });
    _stopwatch.stop();
  }

  void _refreshChrono() {
    setState(() {
      _timerActive = false;
      _time = "00:00:00";
    });
    _stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {

    var timeText =  Container(
          padding: EdgeInsets.only(bottom: 50.0),
          child: Text(
            _time,
            style: Theme.of(context).textTheme.headline3,
          ),
        );

    var startStopButton = Container(
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                        ),
                      ]),
                  child: IconButton(
                    icon: _timerActive ? Icon(Icons.pause, color: Colors.blue[800]) : Icon(Icons.play_arrow,color: Colors.blue[800]),
                    onPressed: _timerActive ? _stopChrono : _startChrono,
                    iconSize: 60,
                  )),
            );

      var refreshButton = Container(
              child: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _timerActive ? null : _refreshChrono,
                iconSize: 30,
              )
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timeText
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            refreshButton,
            startStopButton,
            Container(width: 50,)
          ],
        )
      ],
    );
  }
}
