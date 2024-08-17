import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/games_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../games/kata_berawalan_screen.dart';
import '../games/kata_pola_screnn.dart';

import '../games/voice_game_level2.dart';
import '../services/globals.dart';

class level2 extends StatefulWidget {
  const level2({Key? key}) : super(key: key);

  @override
  _level2State createState() => _level2State();
}

class _level2State extends State<level2> {
  @override
  void initState() {
    super.initState();
    _play();
  }

  @override
  void dispose() {
    _player.dispose(); // Melepaskan sumber audio
    super.dispose();
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('level21', level21);
    prefs.setBool('level22', level22);
    prefs.setBool('level23', level23);
    prefs.setBool('level24', level24);
    prefs.setBool('level25', level25);
    prefs.setBool('level26', level26);
    prefs.setBool('level27', level27);
    prefs.setBool('level28', level28);
    prefs.setBool('level29', level29);
    prefs.setBool('level210', level210);
    prefs.setBool('level211', level211);
    prefs.setBool('level212', level212);
    prefs.setBool('level213', level213);
    prefs.setBool('level214', level214);
    prefs.setBool('level215', level215);
    prefs.setBool('level216', level216);
    prefs.setBool('level217', level217);
    prefs.setBool('level218', level218);
    prefs.setBool('level219', level219);
    prefs.setBool('level220', level220);
    prefs.setBool('level221', level221);
    prefs.setBool('level222', level222);
    prefs.setBool('level223', level223);
    prefs.setBool('level224', level224);
    prefs.setBool('level225', level225);
    prefs.setBool('level226', level226);
    prefs.setBool('level227', level227);
    prefs.setBool('level228', level228);
    prefs.setBool('level229', level229);
    prefs.setBool('level230', level230);
  }

  void _reset() {
    setState(() {
      level21 = false;
      level22 = false;
      level23 = false;
      level24 = false;
      level25 = false;
      level26 = false;
      level27 = false;
      level28 = false;
      level29 = false;
      level210 = false;
      level211 = false;
      level212 = false;
      level213 = false;
      level214 = false;
      level215 = false;
      level216 = false;
      level217 = false;
      level218 = false;
      level219 = false;
      level220 = false;
      level221 = false;
      level222 = false;
      level223 = false;
      level224 = false;
      level225 = false;
      level226 = false;
      level227 = false;
      level228 = false;
      level229 = false;
      level230 = false;
    });
    _saveData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3ABEF9),
        title: const Text(
          'Level 2',
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
              MaterialPageRoute(builder: (context) => const GamesScreen()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _reset();
              // Implement your reset logic here
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/revisi/background aktivias game.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFF3ABEF9),
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
                color: const Color(0xFFFFB22C),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mengidentifikasi bunyi suku kata “Phonemic awareness",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              games1 > 79
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 1;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 sa).m4a';
                            berawalan = "sa";
                            targetImage = 'assets/level2/sapu.png';
                            options = [
                              {
                                'image': 'assets/level2/soda.png',
                                'text': 'soda'
                              },
                              {
                                'image': 'assets/level2/bibir.png',
                                'text': 'bibir'
                              },
                              {
                                'image': 'assets/level2/sapu.png',
                                'text': 'sapu'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level21 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 2;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 si).m4a';
                            berawalan = "si";
                            targetImage = 'assets/level2/siku.png';
                            options = [
                              {
                                'image': 'assets/level2/botol.png',
                                'text': 'botol'
                              },
                              {
                                'image': 'assets/level2/siku.png',
                                'text': 'siku'
                              },
                              {
                                'image': 'assets/level2/badak.png',
                                'text': 'badak'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level22 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 3;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 su).m4a';
                            berawalan = "su";
                            targetImage = 'assets/level2/susu.png';
                            options = [
                              {
                                'image': 'assets/level2/susu.png',
                                'text': 'susu'
                              },
                              {
                                'image': 'assets/level2/siku.png',
                                'text': 'siku'
                              },
                              {
                                'image': 'assets/level2/sapu.png',
                                'text': 'sapu'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level23 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 4;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 so).m4a';
                            berawalan = "so";
                            targetImage = 'assets/level2/soda.png';
                            options = [
                              {
                                'image': 'assets/level2/siku.png',
                                'text': 'siku'
                              },
                              {
                                'image': 'assets/level2/badak.png',
                                'text': 'badak'
                              },
                              {
                                'image': 'assets/level2/soda.png',
                                'text': 'soda'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level24 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 5;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 ba).m4a';
                            berawalan = "ba";
                            targetImage = 'assets/level2/badak.png';
                            options = [
                              {
                                'image': 'assets/level2/badak.png',
                                'text': 'badak'
                              },
                              {
                                'image': 'assets/level2/siku.png',
                                'text': 'siku'
                              },
                              {
                                'image': 'assets/level2/bibir.png',
                                'text': 'bibir'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level25 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 6;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 bi).m4a';
                            berawalan = "bi";
                            targetImage = 'assets/level2/bibir.png';
                            options = [
                              {
                                'image': 'assets/level2/beras.png',
                                'text': 'beras'
                              },
                              {
                                'image': 'assets/level2/bibir.png',
                                'text': 'bibir'
                              },
                              {
                                'image': 'assets/level2/botol.png',
                                'text': 'botol'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level26 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 7;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 be).m4a';
                            berawalan = "be";
                            targetImage = 'assets/level2/beras.png';
                            options = [
                              {
                                'image': 'assets/level2/beras.png',
                                'text': 'beras'
                              },
                              {
                                'image': 'assets/level2/bayam.png',
                                'text': 'bayam'
                              },
                              {
                                'image': 'assets/level2/sapu.png',
                                'text': 'sapu'
                              },
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
                              color: const Color(0xFFFFB22C),

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
              level27 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 8;
                            _player.dispose();
                            sound =
                                'assets/level2/Level 2 (aktivitas 1 bo).m4a';
                            berawalan = "bo";
                            targetImage = 'assets/level2/botol.png';
                            options = [
                              {
                                'image': 'assets/level2/botol.png',
                                'text': 'botol'
                              },
                              {
                                'image': 'assets/level2/susu.png',
                                'text': 'susu'
                              },
                              {
                                'image': 'assets/level2/badak.png',
                                'text': 'badak'
                              },
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
                              color: const Color(0xFFFFB22C),

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
                color: const Color(0xFFFF4E88),
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
                color: const Color(0xFFFF4E88),
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
              level28 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 9;
                            _player.dispose();
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
                              color: const Color(0xFFFF4E88),

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
              level29 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 10;
                            _player.dispose();
                            appbar = "KVKV";
                            voice = "susu";
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
                              color: const Color(0xFFFF4E88),

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
              level210 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 11;
                            _player.dispose();
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
                              shape: BoxShape
                                  .circle, // Membuat tombol berbentuk lingkaran
                              color: Colors.red,
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
              level211 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 12;
                            _player.dispose();
                            appbar = "KVKV";
                            voice = "sawi";
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
                              color: Colors.red,
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
              level212 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 13;
                            _player.dispose();
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
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              level213 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 14;
                            _player.dispose();
                            appbar = "KVKV";
                            voice = "sapu";
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
              level214 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 15;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2a ini dibaca siku).m4a';
                            appbar = "KVKV";
                            kvkv = "siku";
                            option2 = "bebek";
                            option3 = "jari";
                            _player.dispose();
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
              level215 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 16;
                            _player.dispose();
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
              level216 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 17;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2a ini dibaca soda).m4a';
                            appbar = "KVKV";
                            kvkv = "soda";
                            option2 = "kapas";
                            option3 = "batu";
                            _player.dispose();
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
              level217 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 18;
                            appbar = "KVKV";
                            _player.dispose();
                            voice = "soda";
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
              level218 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 19;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2c ini dibaca bibir).m4a';
                            appbar = "KVKVK";
                            kvkv = "bibir";
                            option2 = "lidi";
                            option3 = "siku";
                            _player.dispose();
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
              level219 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 20;
                            _player.dispose();
                            appbar = "KVKVK";
                            voice = "bibir";
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
              level220 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 21;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2c ini dibaca badak).m4a';
                            appbar = "KVKVK";
                            kvkv = "badak";
                            option2 = "rusa";
                            option3 = "duku";
                            _player.dispose();
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
                              color: Colors.red,
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
              level221 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 22;
                            _player.dispose();
                            appbar = "KVKVK";
                            voice = "badak";
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
                              color: Colors.red,
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
              level222 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 23;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2c ini dibaca botol).m4a';
                            appbar = "KVKVK";
                            kvkv = "botol";
                            option2 = "pena";
                            option3 = "dasi";
                            _player.dispose();
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
              level223 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 24;
                            _player.dispose();
                            appbar = "KVKVK";
                            voice = "botol";
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
                      ],
                    )
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              level224 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 25;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2c ini dibaca bayam).m4a';
                            appbar = "KVKVK";
                            kvkv = "bayam";
                            option2 = "madu";
                            option3 = "dasi";
                            _player.dispose();
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
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              level225 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 26;
                            _player.dispose();
                            appbar = "KVKVK";
                            voice = "bayam";
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
                  : enable(),
              const SizedBox(
                height: 30,
              ),
              level226 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 27;
                            sound =
                                'assets/level2/Level 2 (aktivitas 2c ini dibaca beras).m4a';
                            appbar = "KVKVK";
                            kvkv = "beras";
                            option2 = "dasi";
                            option3 = "mata";
                            _player.dispose();
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
                  : enable2(),
              const SizedBox(
                height: 30,
              ),
              level228 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 29;
                            _player.dispose();
                            appbar = "KVKVK";
                            voice = "beras";
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
                                color: Colors
                                    .white, // Warna ikon bintang selalu putih
                                size: 40, // Ukuran ikon bintang
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : enable(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
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
}
