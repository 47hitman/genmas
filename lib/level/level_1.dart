import 'package:flutter/material.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/image_find_item.dart';
import '../games/cari_gambar_screen.dart';
import '../games/cari_gambar_tersembunyi_screen.dart';
import '../games/cocokkan_text_screen.dart';
import '../games/maze_screen.dart';
import '../games/pasangkan_gambar_screen.dart';
import '../games/quits_screen.dart';
import '../games/tebak_gambar_berurutan.dart';
import '../services/globals.dart';

class level1 extends StatefulWidget {
  const level1({Key? key}) : super(key: key);

  @override
  _level1State createState() => _level1State();
}

class _level1State extends State<level1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Level 1',
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
                    "Fase Pra-Abjad",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    extra1 = 'assets/level1/aktivitas2/meja.png';
                    extratext1 = 'meja';
                    extra2 = 'assets/level1/aktivitas2/baju.png';
                    extratext2 = 'baju';
                    extra3 = 'assets/level1/aktivitas2/mobil.png';
                    extratext3 = 'mobil';
                    extra4 = 'assets/level1/aktivitas2/balon.png';
                    extratext4 = 'balon';
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
                        child: const TextMatchingGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    extraTexts = ['meja', 'baju', 'mobil'];
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
                    sound = 'assets/soal1/Level 1 (aktivitas 3a).m4a';
                    targetImage = 'assets/level1/aktivitas3/kucing.png';
                    options = [
                      {
                        'image': 'assets/level1/aktivitas3/tupai.png',
                        'text': ''
                      },
                      {
                        'image': 'assets/level1/aktivitas3/kucing.png',
                        'text': ''
                      },
                      {
                        'image': 'assets/level1/aktivitas3/tikus.png',
                        'text': ''
                      },
                      // {'image': 'assets/level1/aktivitas3/kucing.png', 'text': 'Burung'},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    sound = 'assets/soal1/Level 1 (aktivitas 3b).m4a';
                    targetImage = 'assets/level1/aktivitas3/b.png';
                    options = [
                      {'image': 'assets/level1/aktivitas3/d.png', 'text': ''},
                      {'image': 'assets/level1/aktivitas3/o.png', 'text': ''},
                      {'image': 'assets/level1/aktivitas3/b.png', 'text': ''},
                      // {'image': 'assets/level1/aktivitas3/kucing.png', 'text': 'Burung'},
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
                      // {'image': 'assets/level1/aktivitas3/kucing.png', 'text': 'Burung'},
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
                    sound = 'assets/soal1/Level 1 (aktivitas 4).m4a';
                    imageItems = [
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/apel.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/apel.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/jeruk.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/jeruk.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/nanas.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/nanas.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/ceri.png'),
                      ImageFindItem(
                          imagePath: 'assets/level1/aktivitas4/ceri.png'),
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
                    sound = 'assets/soal1/Level 1 (aktivitas 5).m4a';
                    images = [
                      'assets/level1/aktivitas5/wortel.png',
                      'assets/level1/aktivitas5/brokoli.png',
                      'assets/level1/aktivitas5/wortel.png',
                    ];
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const TebakGambarBerurutanScreen(),
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
                        child: const MatchingGameScreen(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
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
                        child: const MatchingGameScreen(),
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
