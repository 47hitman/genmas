import 'package:flutter/material.dart';
import 'package:genmmas/level/level_4.dart';

import '../asesmentlevel/level_4_assesment.dart';

class menu4level extends StatefulWidget {
  const menu4level({super.key});

  @override
  _menu4levelState createState() => _menu4levelState();
}

class _menu4levelState extends State<menu4level> {
  int _selectedIndex = 0;

  // Updated widget options list to include HomeScreen
  final List<Widget> _widgetOptions = <Widget>[
    const level4(),
    const asesment4level()
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
        // Updated to switch between pages based on the selected index
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Soal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Ujian',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 19, 212, 42),
        onTap: _onItemTapped,
      ),
    );
  }
}
