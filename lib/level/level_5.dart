import 'package:flutter/material.dart';
import 'package:genmmas/games/voice_game_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../games/kata_berawalan_screen.dart';
import '../games/kata_pola_screnn.dart';

import '../services/globals.dart';

class level5 extends StatefulWidget {
  const level5({Key? key}) : super(key: key);

  @override
  _level5State createState() => _level5State();
}

class _level5State extends State<level5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Level 5',
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
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "susu";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    voice = "sawi";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "sapu";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    voice = "siku";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "soda";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 2",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Kata Pola KVKVK",
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
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "bibir";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    voice = "badak";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "botol";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    voice = "bayam";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    voice = "beras";
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const VoiceGameScreen(),
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
