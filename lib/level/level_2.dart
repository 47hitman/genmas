import 'package:flutter/material.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/image_find_item.dart';
import '../games/cari_gambar_screen.dart';
import '../games/cari_gambar_tersembunyi_screen.dart';
import '../games/maze_screen.dart';
import '../games/pasangkan_gambar_screen.dart';
import '../services/globals.dart';

class level2 extends StatefulWidget {
  const level2({Key? key}) : super(key: key);

  @override
  _level2State createState() => _level2State();
}

class _level2State extends State<level2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 247, 203),
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
                    "Aktivitas 1",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Figure ground / Objek dan latar belakang",
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
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const HiddenObjectGameScreen(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 2",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Discrimination",
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
                    items = [
                      {'image': 'assets/soal1/ular.png', 'text': 'Ular'},
                      {'image': 'assets/soal1/tupai.png', 'text': 'Tupai'},
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
                    "Aktivitas 3",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Closure / Kelengkapan objek yang dilihat",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    targetImage = 'assets/soal1/burung.png';
                    options = [
                      {'image': 'assets/soal1/ular.png', 'text': 'Ular'},
                      {'image': 'assets/soal1/tupai.png', 'text': 'Tupai'},
                      {'image': 'assets/soal1/kelinci.png', 'text': 'Kelinci'},
                      {'image': 'assets/soal1/burung.png', 'text': 'Burung'},
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 4",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Memory / Ingatan terhadap objek yang dilihat",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    imageItems = [
                      ImageFindItem(imagePath: 'assets/soal1/ular.png'),
                      ImageFindItem(imagePath: 'assets/soal1/ular.png'),
                      ImageFindItem(imagePath: 'assets/soal1/tupai.png'),
                      ImageFindItem(imagePath: 'assets/soal1/tupai.png'),
                      ImageFindItem(imagePath: 'assets/soal1/kelinci.png'),
                      ImageFindItem(imagePath: 'assets/soal1/kelinci.png'),
                      ImageFindItem(imagePath: 'assets/soal1/kupukupu.png'),
                      ImageFindItem(imagePath: 'assets/soal1/kupukupu.png'),
                    ];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const CariGambarScreen(),
                      ),
                    );
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
                    "Aktivitas 5",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Sequential / Urutan objek yang diliha",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 6",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Form Constancy/ Kekekalan objek yang dilihat",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    "Aktivitas 7",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Visual Spatial Skill/Keruangan",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const MazeScreen(),
                      ),
                    );
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
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
