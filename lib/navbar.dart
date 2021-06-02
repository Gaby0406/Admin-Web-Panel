import 'package:flutter/material.dart';
import 'package:flutter2/Models/User.dart';

/// This is the stateful widget that the main application instantiates.
class HomePage extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[Expanded(child: AdminHome())],
        ),
      ),
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
    );
  }
}

/*
/// This is the stateful widget that the main application instantiates.
class HomePage extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<HomePage> {
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    PetBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        //colors
        color: AppTheme.ZK_Azure,
        backgroundColor: Colors.white,
        height: 50,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.ease,
        items: <Widget>[
          Icon(Icons.date_range_rounded, size: 20, color: Colors.white),
          Icon(Icons.home_rounded, size: 20, color: Colors.white),
          Icon(Icons.pets_rounded, size: 20, color: Colors.white)
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

*/
