import 'package:body_utilities/screens/ActiviteScreen.dart';
import 'package:body_utilities/screens/ChronometreScreen.dart';
import 'package:body_utilities/screens/SeanceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _currentIndex = 0;

  final _screens = [
    ChronometreScreen(),
    SeanceScreen(),
    ActiviteScreen()
  ];

  final _titles = [
    "Chronomètre",
    "Mes Séances",
    "Activité"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 30,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Chronomètre'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Mes Séances')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Activité')
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}