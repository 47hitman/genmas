import 'package:flutter/material.dart';
import 'package:genmmas/games/kata_pola_screnn.dart';
import 'package:genmmas/games/voice_game_level2.dart';
import 'package:page_transition/page_transition.dart';
import '../games/cari_gambar_screen.dart';
import '../games/cocokkan_gambar_screen.dart';
import '../games/kata_berawalan_screen.dart';
import '../games/maze_screen.dart';
import '../models/image_find_item.dart';
import '../services/globals.dart';

class asesment2level extends StatefulWidget {
  const asesment2level({super.key});

  @override
  State<asesment2level> createState() => _asesment2levelState();
}

class _asesment2levelState extends State<asesment2level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 19, 212, 42),
          title: const Text(
            'Level 2 Ujian',
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
                      "Ujian Level 2",
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
                        color: const Color.fromARGB(255, 19, 212, 42),
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
                      width: 80, // Lebar tombol
                      height: 80, // Tinggi tombol
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(255, 19, 212, 42),
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
                      aktivitas2 = 4;
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(255, 19, 212, 42),
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(255, 19, 212, 42),
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
                          child: const BerawalnGameScreen(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
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
                      sound = 'assets/level2/Level 2 (aktivitas 1 si).m4a';
                      berawalan = "si";
                      targetImage = 'assets/level2/siku.png';
                      options = [
                        {'image': 'assets/level2/botol.png', 'text': 'botol'},
                        {'image': 'assets/level2/siku.png', 'text': 'siku'},
                        {'image': 'assets/level2/badak.png', 'text': 'badak'},
                      ];
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const BerawalnGameScreen(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
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
                      sound = 'assets/level2/Level 2 (aktivitas 1 su).m4a';
                      berawalan = "su";
                      targetImage = 'assets/level2/susu.png';
                      options = [
                        {'image': 'assets/level2/susu.png', 'text': 'susu'},
                        {'image': 'assets/level2/siku.png', 'text': 'siku'},
                        {'image': 'assets/level2/sapu.png', 'text': 'sapu'},
                      ];
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const BerawalnGameScreen(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
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
                  InkWell(
                    onTap: () {
                      appbar = "KVKV";
                      voice = "siku";
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const VoiceGameScreen2(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
                    },
                    child: Container(
                      width: 80, // Lebar tombol
                      height: 80, // Tinggi tombol
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: Colors.yellow,
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
                  InkWell(
                    onTap: () {
                      sound =
                          'assets/level2/Level 2 (aktivitas 2c ini dibaca bibir).m4a';
                      appbar = "KVKVK";
                      kvkv = "bibir";
                      option2 = "lidi";
                      option3 = "siku";
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
            ],
          ),
        ));
  }
}
