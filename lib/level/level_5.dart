import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/games/voice_game_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../games_screen.dart';
import '../services/globals.dart';

class level5 extends StatefulWidget {
  const level5({Key? key}) : super(key: key);

  @override
  _level5State createState() => _level5State();
}

class _level5State extends State<level5> {
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

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('level51', level51);
    prefs.setBool('level52', level52);
    prefs.setBool('level53', level53);
    prefs.setBool('level54', level54);
    prefs.setBool('level55', level55);
    prefs.setBool('level56', level56);
    prefs.setBool('level57', level57);
    prefs.setBool('level58', level58);
    prefs.setBool('level59', level59);
    prefs.setBool('level50', level50);
  }

  void _reset() {
    setState(() {
      level51 = false;
      level52 = false;
      level53 = false;
      level54 = false;
      level55 = false;
      level56 = false;
      level57 = false;
      level58 = false;
      level59 = false;
      level50 = false;
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
          'Level 5',
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
            image: AssetImage("assets/background7.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.pink,
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
              games4 > 79
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 1;
                            _player.dispose();
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
              level51 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 2;
                            _player.dispose();
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
              level52 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 3;
                            _player.dispose();
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
              level53 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 4;
                            _player.dispose();
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
              level54 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            aktivitas2 = 5;
                            _player.dispose();
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
              level55 != false
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
              level56 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 7;
                            _player.dispose();
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
              level57 != false
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
              level58 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 9;
                            _player.dispose();
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
              level59 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
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
