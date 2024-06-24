import 'package:flutter/material.dart';
import 'package:genmmas/level/level_3.dart';

import '../asesmentlevel/level_3_assesment.dart';

class menu3level extends StatefulWidget {
  const menu3level({super.key});

  @override
  _menu3levelState createState() => _menu3levelState();
}

class _menu3levelState extends State<menu3level> {
  int _selectedIndex = 0;

  // Updated widget options list to include HomeScreen
  final List<Widget> _widgetOptions = <Widget>[
    const level3(),
    const asesment3level()
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
