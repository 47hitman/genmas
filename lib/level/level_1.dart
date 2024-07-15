// ignore_for_file: library_private_types_in_public_api

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/games/cocokkan_gambar_screen.dart';
import 'package:genmmas/games_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  void initState() {
    super.initState();
    _loadData();
    _play();
  }

  @override
  void dispose() {
    _player.dispose(); // Melepaskan sumber audio
    super.dispose();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.open(
      Audio('assets/outro.mp3'),
      volume: 20,
      autoStart: true,
      showNotification: true,
      loopMode: LoopMode.single, // Loop the audio
    );
  }

  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      aktivast1 = prefs.getBool('aktivast1') ?? false;
      aktivast21 = prefs.getBool('aktivast21') ?? false;
      aktivast22 = prefs.getBool('aktivast22') ?? false;
      aktivast23 = prefs.getBool('aktivast23') ?? false;
      aktivast24 = prefs.getBool('aktivast24') ?? false;
      aktivast25 = prefs.getBool('aktivast25') ?? false;
      aktivast26 = prefs.getBool('aktivast26') ?? false;
      aktivast27 = prefs.getBool('aktivast27') ?? false;
      aktivast28 = prefs.getBool('aktivast28') ?? false;
      aktivast31 = prefs.getBool('aktivast31') ?? false;
      aktivast32 = prefs.getBool('aktivast32') ?? false;
      aktivast33 = prefs.getBool('aktivast33') ?? false;
      aktivast4 = prefs.getBool('aktivast4') ?? false;
      aktivast5 = prefs.getBool('aktivast5') ?? false;
      aktivast61 = prefs.getBool('aktivast61') ?? false;
      aktivast62 = prefs.getBool('aktivast62') ?? false;
      aktivast63 = prefs.getBool('aktivast63') ?? false;
      aktivast7 = prefs.getBool('aktivast7') ?? false;
    });
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('aktivast1', aktivast1);
    prefs.setBool('aktivast21', aktivast21);
    prefs.setBool('aktivast22', aktivast22);
    prefs.setBool('aktivast23', aktivast23);
    prefs.setBool('aktivast24', aktivast24);
    prefs.setBool('aktivast25', aktivast25);
    prefs.setBool('aktivast26', aktivast26);
    prefs.setBool('aktivast27', aktivast27);
    prefs.setBool('aktivast28', aktivast28);
    prefs.setBool('aktivast31', aktivast31);
    prefs.setBool('aktivast32', aktivast32);
    prefs.setBool('aktivast33', aktivast33);
    prefs.setBool('aktivast4', aktivast4);
    prefs.setBool('aktivast5', aktivast5);
    prefs.setBool('aktivast61', aktivast61);
    prefs.setBool('aktivast62', aktivast62);
    prefs.setBool('aktivast63', aktivast63);
    prefs.setBool('aktivast7', aktivast7);
  }

  void _reset() {
    setState(() {
      aktivast1 = false;
      aktivast21 = false;
      aktivast22 = false;
      aktivast23 = false;
      aktivast24 = false;
      aktivast25 = false;
      aktivast26 = false;
      aktivast27 = false;
      aktivast28 = false;
      aktivast31 = false;
      aktivast32 = false;
      aktivast33 = false;
      aktivast4 = false;
      aktivast5 = false;
      aktivast61 = false;
      aktivast62 = false;
      aktivast63 = false;
      aktivast7 = false;
    });
    _saveData();
  }

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _player.dispose();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const GamesScreen()), // Replace SpecificPage with your target page
              );
            },
          )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background7.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
              // ElevatedButton(
              //   onPressed: _reset,
              //   child: const Text('Reset All'),
              // ),
              Container(
                width: double.infinity,
                color: Colors.red,
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
                      _player.dispose();
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
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: Colors.red, // Warna tombol
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
              Container(
                width: double.infinity,
                color: Colors.orange,
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
              aktivast1 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast21 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              color: Colors.orange, // Warna tombol
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              aktivast22 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              color: Colors.orange, // Warna tombol
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast23 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              aktivast24 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                            width: 80, // Lebar tombol
                            height: 80, // Tinggi tombol
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast25 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                            width: 80, // Lebar tombol
                            height: 80, // Tinggi tombol
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              aktivast26 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas2 = 7;
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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast27 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas2 = 8;
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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.orange,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: Colors.yellow,
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
              aktivast28 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas3 = 1;
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              aktivast31 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas3 = 2;
                            sound = 'assets/soal1/Level 1 (aktivitas 3b).m4a';
                            targetImage = 'assets/level1/aktivitas3/b.png';
                            options = [
                              {
                                'image': 'assets/level1/aktivitas3/d.png',
                                'text': ''
                              },
                              {
                                'image': 'assets/level1/aktivitas3/o.png',
                                'text': ''
                              },
                              {
                                'image': 'assets/level1/aktivitas3/b.png',
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast32 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
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
              aktivast33 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            sound = 'assets/soal1/Level 1 (aktivitas 4).m4a';
                            imageItems = [
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/apel.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/apel.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/jeruk.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/jeruk.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/nanas.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/nanas.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/ceri.png'),
                              ImageFindItem(
                                  imagePath:
                                      'assets/level1/aktivitas4/ceri.png'),
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
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
              aktivast4 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.blue,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: Colors.purple,
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
              aktivast5 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas6 = 1;

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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.purple,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              aktivast61 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas6 = 2;
                            targetImage =
                                'assets/level1/aktivitas6/segiempat.png';
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
                              color: Colors.purple,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              aktivast62 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            aktivitas6 = 3;
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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.purple,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: Colors.pink,
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
              aktivast63 == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
                              color: Colors.pink,
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget enable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80, // Lebar tombol
          height: 80, // Tinggi tombol
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Membuat tombol berbentuk lingkaran
            color: Colors.grey, // Warna tombol abu-abu ketika disable
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
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
        const SizedBox(
          width: 50,
        ),
      ],
    );
  }

  Widget enable2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 50,
        ),
        Container(
          width: 80, // Lebar tombol
          height: 80, // Tinggi tombol
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Membuat tombol berbentuk lingkaran
            color: Colors.grey, // Warna tombol abu-abu ketika disable
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
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
      ],
    );
  }
}
