import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../services/globals.dart';
import 'game_asesment/cocokkan_gambar_ujian_screen.dart';
import 'game_asesment/kata_berawalan_ujian.dart';
import 'game_asesment/kata_pola_ujian_screen.dart';
import 'game_asesment/lengkapi_kata_ujian_screen.dart';
import 'game_asesment/pasangkan_gambar_ujian_screen.dart';
import 'game_asesment/quit_ujian_screen.dart';

final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

class asesment3level extends StatefulWidget {
  const asesment3level({super.key});

  @override
  State<asesment3level> createState() => _asesment3levelState();
}

class _asesment3levelState extends State<asesment3level> {
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
                // Add your completion logic here
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
          'Level 3 Ujian',
          style: TextStyle(color: Colors.white), // Text warna putih
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Icon (panah kembali) warna putih
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
                    "Ujian Level 3",
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
                  aktivitas3 = 3;
                  sound = 'assets/soal1/Level 1 (aktivitas 3b).m4a';
                  targetImage = 'assets/level1/aktivitas3/b.png';
                  options = [
                    {'image': 'assets/level1/aktivitas3/d.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/o.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/b.png', 'text': ''},
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
                  aktivitas3 = 3;
                  sound = 'assets/soal1/Level 1 (aktivitas 3c).m4a';
                  targetImage = 'assets/level1/aktivitas3/buku.png';
                  options = [
                    {'image': 'assets/level1/aktivitas3/buku.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/baju.png', 'text': ''},
                    {'image': 'assets/level1/aktivitas3/bola.png', 'text': ''},
                    // {'image': 'assets/level1/aktivitas3/kucing.png', 'text': 'Burung'},
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
                  sound = 'assets/level2/Level 2 (aktivitas 1 sa).m4a';
                  berawalan = "sa";
                  targetImage = 'assets/level2/sapu.png';
                  options = [
                    {'image': 'assets/level2/soda.png', 'text': 'soda'},
                    {'image': 'assets/level2/bibir.png', 'text': 'bibir'},
                    {'image': 'assets/level2/sapu.png', 'text': 'sapu'},
                  ];
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const BerawalnUjianGameScreen(),
                    ),
                  );
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
                  sound = 'assets/level2/Level 2 (aktivitas 1 so).m4a';
                  berawalan = "so";
                  targetImage = 'assets/level2/soda.png';
                  options = [
                    {'image': 'assets/level2/siku.png', 'text': 'siku'},
                    {'image': 'assets/level2/badak.png', 'text': 'badak'},
                    {'image': 'assets/level2/soda.png', 'text': 'soda'},
                  ];
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const BerawalnUjianGameScreen(),
                    ),
                  );
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
                  sound =
                      'assets/level2/Level 2 (aktivitas 2a ini dibaca susu).m4a';
                  appbar = "KVKV";
                  kvkv = "susu";
                  option2 = "air";
                  option3 = "roti";

                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const KataPolaUjian(),
                    ),
                  );
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  sound =
                      'assets/level2/Level 2 (aktivitas 2a ini dibaca sapu).m4a';
                  appbar = "KVKV";
                  kvkv = "sapu";
                  option2 = "besi";
                  option3 = "kotak";

                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const KataPolaUjian(),
                    ),
                  );
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
                  {
                    assetName = 'sapu';
                    assetLocation = "assets/level3/aktivitas1/sapu.png";
                    answer = ["", "", "", ""];
                    optionsAsesmen = ["a", "p", "s", "u"];
                    correctAnswerAsesmen = ["s", "a", "p" "u"];

                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const LengkapiKataUjianScreen(),
                      ),
                    );
                  }
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
                  {
                    assetName = 'soda';
                    assetLocation = "assets/level3/aktivitas1/soda.png";
                    answer = ["", "", "", ""];
                    optionsAsesmen = ["o", "s", "a", "d"];
                    correctAnswerAsesmen = ["s", "o", "d" "a"];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const LengkapiKataUjianScreen(),
                      ),
                    );
                  }
                  // Aksi yang ingin dilakukan ketika tombol ditekan
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
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        child: loginButton,
      ),
    );
  }
}
