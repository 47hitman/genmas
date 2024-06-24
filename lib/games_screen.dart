import 'package:flutter/material.dart';
import 'package:genmmas/level/level_1.dart';
import 'package:page_transition/page_transition.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  void _onGamesTap(int level) {
    // Ganti sesuai dengan fungsi navigasi ke level yang dipilih
    switch (level) {
      case 1:
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 300),
            type: PageTransitionType.rightToLeft,
            child: const level1(),
          ),
        );
        break;
      case 2:
        // Tambahkan navigasi ke Level 2 jika diperlukan
        break;
      default:
        break;
    }
  }

  void _onAssessmentTap() {
    // Aksi saat tombol ASESMEN ditekan
    print('ASESMEN ditekan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GAMES',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(
            255, 19, 212, 42), // Ubah warna latar belakang appbar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
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
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () => _onGamesTap(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
