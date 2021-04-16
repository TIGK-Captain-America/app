import 'package:flutter/material.dart';
import 'package:mower/src/views/controlMower/controlMower.dart';
import 'package:mower/src/views/home/home.dart';
import 'package:mower/src/views/mowerView/mowerView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomeView(),
    ControlMowerPage(),
    MowerView(),
  ];

  void onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: 'Mower'),
          BottomNavigationBarItem(icon: Icon(Icons.alt_route_rounded), label: 'Map'),
        ],
        currentIndex: currentIndex,
        onTap: onItemTap,
      ),
    );
  }
}
