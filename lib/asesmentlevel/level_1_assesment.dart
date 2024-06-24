import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../games/cari_gambar_tersembunyi_screen.dart';
import '../games/cocokkan_gambar_screen.dart';
import '../games/cocokkan_text_screen.dart';
import '../games/quits_screen.dart';
import '../services/globals.dart';

class asesment1level extends StatefulWidget {
  const asesment1level({super.key});

  @override
  State<asesment1level> createState() => _asesment1levelState();
}

class _asesment1levelState extends State<asesment1level> {
  @override
  Widget build(BuildContext context) {
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
                          child: const HiddenObjectGameScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 80, // Lebar tombol
                      height: 80, // Tinggi tombol
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
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
        ));
  }
}
