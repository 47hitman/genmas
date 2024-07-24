import 'package:flutter/material.dart';
import 'package:genmmas/services/globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../games_screen.dart';
import '../homeScreen.dart';
import 'game_asesment/cocokkan_gambar_ujian_screen.dart';
import 'game_asesment/cocokkan_text_ujian_screen.dart';
import 'game_asesment/pasangkan_gambar_ujian_screen.dart';
import 'game_asesment/quit_ujian_screen.dart';

final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

class asesment1level extends StatefulWidget {
  const asesment1level({super.key});

  @override
  State<asesment1level> createState() => _Asesment1LevelState();
}

class _Asesment1LevelState extends State<asesment1level> {
  void _evaluateUjianValues() {
    int score = 0;
    int trueCount = 0;

    List<bool> ujianList = [
      ujian1,
      ujian2,
      ujian3,
      ujian4,
      ujian5,
      ujian6,
      ujian7,
      ujian8,
      ujian9,
      ujian10
    ];

    for (var value in ujianList) {
      if (value) {
        trueCount++;
        score += 10;
      }
    }

    if (trueCount == 2) {
      score = 20;
    }
    setState(() {
      games1 = score;
    });

    // print('Score: $score');
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah kamu yakin menyelesaikan ujian?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Tidak',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              onPressed: () {
                _btnController.stop();
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Iya',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              onPressed: () {
                _btnController.stop();
                _evaluateUjianValues(); // Evaluate and print the values
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child:
                        const HomeScreen(), // Ganti dengan widget level yang sesuai
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final loginButton = RoundedLoadingButton(
      color: const Color.fromARGB(255, 19, 212, 42),
      controller: _btnController,
      onPressed: () {
        // print('ujian1: $ujian1');
        // print('ujian2: $ujian2');
        // print('ujian3: $ujian3');
        // print('ujian4: $ujian4');
        // print('ujian5: $ujian5');
        // print('ujian6: $ujian6');
        // print('ujian7: $ujian7');
        // print('ujian8: $ujian8');
        // print('ujian9: $ujian9');
        // print('ujian10: $ujian10');
        _showConfirmationDialog();
      },
      child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 212, 42),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
              child: Text("Selesai",
                  style: TextStyle(color: Colors.white, fontSize: 26)))),
    );
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 19, 212, 42),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ujian Level 1",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Point $games1",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
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
                    ujian = 1;
                    // ujian1 = false;
                    // ujian2 = false;
                    // ujian3 = false;
                    // ujian4 = false;
                    // ujian5 = false;
                    // ujian6 = false;
                    // ujian7 = false;
                    // ujian8 = false;
                    // ujian9 = false;
                    // ujian10 = false;
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
                        child: const ImageMatchingUjianGameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                    ujian = 2;
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
                        child: const TextMatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                    ujian = 3;
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
                        child: const TextMatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                    ujian = 1;
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
                        child: const MatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                    ujian = 5;
                    aktivitas3 = 3;
                    sound = 'assets/soal1/Level 1 (aktivitas 3c).m4a';
                    targetImage = 'assets/level1/aktivitas3/buku.png';
                    options = [
                      {
                        'image': 'assets/level1/aktivitas3/buku.png',
                        'text': ''
                      },
                      {
                        'image': 'assets/level1/aktivitas3/baju.png',
                        'text': ''
                      },
                      {
                        'image': 'assets/level1/aktivitas3/bola.png',
                        'text': ''
                      },
                    ];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const SingleImageMatchingUjianGameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    ujian = 6;
                    aktivitas2 = 1;
                    extra1 = '';
                    extratext1 = '';
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
                        child: const ImageMatchingUjianGameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                        'Soal 6',
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
                    ujian = 7;
                    aktivitas2 = 3;
                    extra1 = 'assets/level1/aktivitas2/meja.png';
                    extratext1 = 'meja';
                    extra2 = 'assets/level1/aktivitas2/baju.png';
                    extratext2 = 'baju';
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
                        child: const ImageMatchingUjianGameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                        'Soal 7',
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
                    ujian = 9;
                    extraTexts = ['meja', 'baju'];
                    itemstext = [
                      'buku',
                      'bola',
                    ];

                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const TextMatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                        'Soal 8',
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
                    targetImage = 'assets/level1/aktivitas6/kubus.png';
                    options = [
                      {
                        'image': 'dadu',
                        'path': 'assets/level1/aktivitas6/dadu.png',
                      },
                      {
                        'image': 'bola',
                        'path': 'assets/level1/aktivitas6/bola.png',
                      },
                      {
                        'image': 'gelas',
                        'path': 'assets/level1/aktivitas6/gelas.png',
                      },
                    ];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const MatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                        'Soal 9',
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
                    ujian = 10;
                    targetImage = 'assets/level1/aktivitas6/bulat.png';
                    options = [
                      {
                        'image': 'jam',
                        'path': 'assets/level1/aktivitas6/jam.png',
                      },
                      {
                        'image': 'jeruk',
                        'path': 'assets/level1/aktivitas6/jeruk.png',
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
                        child: const MatchingGameUjianScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth *
                        0.9, // Button selebar layar (90% dari lebar layar)
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 165, 0), // Bright orange
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
                        'Soal 10',
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
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        child: loginButton,
      ),
    );
  }
}
