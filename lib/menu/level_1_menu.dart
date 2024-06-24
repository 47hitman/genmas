import 'package:flutter/material.dart';
import 'package:genmmas/level/level_1.dart';

import '../asesmentlevel/level_1_assesment.dart';

class menu1level extends StatefulWidget {
  const menu1level({super.key});

  @override
  _menu1levelState createState() => _menu1levelState();
}

class _menu1levelState extends State<menu1level> {
  int _selectedIndex = 0;

  // Updated widget options list to include HomeScreen
  final List<Widget> _widgetOptions = <Widget>[
    const level1(),
    const asesment1level()
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
