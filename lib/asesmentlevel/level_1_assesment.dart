import 'package:flutter/material.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:genmmas/services/globals.dart';
import 'package:page_transition/page_transition.dart';

import '../games/cocokkan_text_screen.dart';
import '../games/pasangkan_gambar_screen.dart';
import '../games/quits_screen.dart';
import '../games_screen.dart';

class asesment1level extends StatefulWidget {
  const asesment1level({super.key});

  @override
  State<asesment1level> createState() => _Asesment1LevelState();
}

class _Asesment1LevelState extends State<asesment1level> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Level 1 Ujian',
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
                builder: (context) => const GamesScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ujian Level 1",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Point 0",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  aktivitas2 = 2;
                  extra1 = 'assets/level1/aktivitas2/meja.png';
                  extratext1 = 'meja';
                  extra2 = '';
                  extratext2 = '';
                  extra3 = '';
                  extratext3 = '';
                  extra4 = '';
                  extratext4 = '';
                  items = [
                    {
                      'image': 'assets/level1/aktivitas2/buku.png',
                      'text': 'Buku'
                    },
                    {
                      'image': 'assets/level1/aktivitas2/bola.png',
                      'text': 'Bola'
                    },
                  ];
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const ImageMatchingGameScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.9, // Button selebar layar (90% dari lebar layar)
                  height: 80,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 165, 0), // Bright orange
                    borderRadius:
                        BorderRadius.circular(20), // More rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Soal 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Reduced font size for balance
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  aktivitas2 = 5;
                  extraTexts = [];

                  itemstext = [
                    'buku',
                    'bola',
                  ];

                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const TextMatchingGameScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.9, // Button selebar layar (90% dari lebar layar)
                  height: 80,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 165, 0), // Bright orange
                    borderRadius:
                        BorderRadius.circular(20), // More rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Soal 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Reduced font size for balance
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  aktivitas2 = 6;
                  extraTexts = ['meja'];
                  itemstext = [
                    'buku',
                    'bola',
                  ];

                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const TextMatchingGameScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.9, // Button selebar layar (90% dari lebar layar)
                  height: 80,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 165, 0), // Bright orange
                    borderRadius:
                        BorderRadius.circular(20), // More rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Soal 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Reduced font size for balance
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  aktivitas6 = 2;
                  targetImage = 'assets/level1/aktivitas6/segiempat.png';
                  options = [
                    {
                      'image': 'ketupat',
                      'path': 'assets/level1/aktivitas6/ketupat.png',
                    },
                    {
                      'image': 'escream',
                      'path': 'assets/level1/aktivitas6/escream.png',
                    },
                    {
                      'image': 'mail',
                      'path': 'assets/level1/aktivitas6/mail.png',
                    },
                  ];

                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const MatchingGameScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.9, // Button selebar layar (90% dari lebar layar)
                  height: 80,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 165, 0), // Bright orange
                    borderRadius:
                        BorderRadius.circular(20), // More rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Soal 4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Reduced font size for balance
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  aktivitas3 = 3;
                  sound = 'assets/soal1/Level 1 (aktivitas 3c).m4a';
                  targetImage = 'assets/level1/aktivitas3/buku.png';
                  options = [
                    {'image': 'assets/level1/aktivitas3/buku.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/baju.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/bola.png', 'text': ''},
                  ];
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const SingleImageMatchingGameScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.9, // Button selebar layar (90% dari lebar layar)
                  height: 80,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 165, 0), // Bright orange
                    borderRadius:
                        BorderRadius.circular(20), // More rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Soal 5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Reduced font size for balance
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
