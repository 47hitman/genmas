import 'package:flutter/material.dart';
import 'package:genmmas/homeScreen.dart';
import 'package:genmmas/list_soal_screen.dart';
import 'package:genmmas/userPorfile.dart';

class MenuScreen extends StatefulWidget {
  static const String id = "MenuScreen";
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  // Updated widget options list to include HomeScreen
  final List<Widget> _widgetOptions = <Widget>[
    // const HomeScreens(),
    // const galeryScreen(),
    // const tweetScreen(),
    const HomeScreen(),

    // const ListSoalScreen(),
    // const Text("dua"),
    const ProfileScreen()
    // const Text("tiga"),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.browse_gallery),
          //   label: 'Galery',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 19, 212, 42),
        onTap: _onItemTapped,
      ),
    );
  }
}
