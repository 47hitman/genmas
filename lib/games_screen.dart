import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'level/level_5.dart';
import 'menu/level_1_menu.dart';
import 'menu/level_2_menu.dart';
import 'menu/level_3_menu.dart';
import 'menu/level_4_menu.dart';
import 'menuScreens.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  void _onGamesTap(int level) {
    // Ganti sesuai dengan fungsi navigasi ke level yang dipilih
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        type: PageTransitionType.rightToLeft,
        child: const menu1level(), // Ganti dengan widget level yang sesuai
      ),
    );
  }

  void _onGamesTap2(int level) {
    // Ganti sesuai dengan fungsi navigasi ke level yang dipilih
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        type: PageTransitionType.rightToLeft,
        child: const menu2level(), // Ganti dengan widget level yang sesuai
      ),
    );
  }

  void _onGamesTap3(int level) {
    // Ganti sesuai dengan fungsi navigasi ke level yang dipilih
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        type: PageTransitionType.rightToLeft,
        child: const menu3level(), // Ganti dengan widget level yang sesuai
      ),
    );
  }

  void _onGamesTap4(int level) {
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        type: PageTransitionType.rightToLeft,
        child: const menu4level(), // Ganti dengan widget level yang sesuai
      ),
    );
  }

  void _onGamesTap5(int level) {
    // Ganti sesuai dengan fungsi navigasi ke level yang dipilih
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        type: PageTransitionType.rightToLeft,
        child: const level5(), // Ganti dengan widget level yang sesuai
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 19, 212, 42),
          title: const Text(
            'Games',
            style: TextStyle(color: Colors.white), // Text warna putih
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, // Icon (panah kembali) warna putih
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MenuScreen()), // Replace SpecificPage with your target page
              );
            },
          )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          children: [
            GestureDetector(
              onTap: () => _onGamesTap(1), // Ubah menjadi level 1
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 100,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "LEVEL 1",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _onGamesTap2(
                  2), // Ubah menjadi level 2 jika sudah ditambahkan
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 100,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "LEVEL 2",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _onGamesTap3(
                  3), // Ubah menjadi level 3 jika sudah ditambahkan
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 100,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "LEVEL 3",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _onGamesTap4(
                  3), // Ubah menjadi level 3 jika sudah ditambahkan
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 100,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "LEVEL 4",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _onGamesTap5(
                  3), // Ubah menjadi level 3 jika sudah ditambahkan
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 100,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "LEVEL 5",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: GamesScreen(),
  ));
}
