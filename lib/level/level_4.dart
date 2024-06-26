import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../games/kata_berawalan_screen.dart';
import '../games/kata_pola_screnn.dart';

import '../games/lelvel_4_games.dart';
import '../services/globals.dart';

class level4 extends StatefulWidget {
  const level4({Key? key}) : super(key: key);

  @override
  _level4State createState() => _level4State();
}

class _level4State extends State<level4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Level 2',
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Fase Alfabet Parsial",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mengidentifikasi bunyi suku kata “Phonemic Awareness”",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // sound = 'assets/level2/Level 2 (aktivitas 1 bo).m4a';
                    // berawalan = "bo";
                    // targetImage = 'assets/level2/botol.png';
                    // options = [
                    //   {'image': 'assets/level2/botol.png', 'text': 'botol'},
                    //   {'image': 'assets/level2/susu.png', 'text': 'susu'},
                    //   {'image': 'assets/level2/badak.png', 'text': 'badak'},
                    // ];
                    targetImage = 'assets/level4/susu.png';
                    options4 = ["su", "mo", "sa", "su"];
                    answer = ["", ""];
                    correctAnswer = ["su", "su"];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const SusunKataScreenLevel4(),
                      ),
                    );
                    // Aksi yang ingin dilakukan ketika tombol ditekan
                  },
                  child: Container(
                    width: 80, // Lebar tombol
                    height: 80, // Tinggi tombol
                    decoration: BoxDecoration(
                      shape:
                          BoxShape.circle, // Membuat tombol berbentuk lingkaran
                      color: const Color.fromARGB(
                          255, 19, 212, 42), // Warna tombol
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.white, // Warna ikon bintang selalu putih
                        size: 40, // Ukuran ikon bintang
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pengenalan Kata",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 1",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Kata Pola KVKV",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    sound =
                        'assets/level2/Level 2 (aktivitas 2a ini dibaca sawi).m4a';
                    appbar = "KVKV";
                    kvkv = "sawi";
                    option2 = "donat";
                    option3 = "palu";

                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const KataPola(),
                      ),
                    );
                    // Aksi yang ingin dilakukan ketika tombol ditekan
                  },
                  child: Container(
                    width: 80, // Lebar tombol
                    height: 80, // Tinggi tombol
                    decoration: BoxDecoration(
                      shape:
                          BoxShape.circle, // Membuat tombol berbentuk lingkaran
                      color: const Color.fromARGB(
                          255, 19, 212, 42), // Warna tombol
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.white, // Warna ikon bintang selalu putih
                        size: 40, // Ukuran ikon bintang
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
