import 'package:flutter/material.dart';

import '../asesmentlevel/level_1_assesment.dart';
import '../level/level_2.dart';

class menu2level extends StatefulWidget {
  const menu2level({super.key});

  @override
  _menu2levelState createState() => _menu2levelState();
}

class _menu2levelState extends State<menu2level> {
  int _selectedIndex = 0;

  // Updated widget options list to include HomeScreen
  final List<Widget> _widgetOptions = <Widget>[
    const level2(),
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
