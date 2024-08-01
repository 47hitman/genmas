import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../games/lelvel_4_games.dart';
import '../games_screen.dart';
import '../services/globals.dart';

class level4 extends StatefulWidget {
  const level4({Key? key}) : super(key: key);

  @override
  _level4State createState() => _level4State();
}

class _level4State extends State<level4> {
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
    prefs.setBool('level41', level41);
    prefs.setBool('level42', level42);
    prefs.setBool('level43', level43);
    prefs.setBool('level44', level44);
    prefs.setBool('level45', level45);
    prefs.setBool('level46', level46);
    prefs.setBool('level47', level47);
    prefs.setBool('level48', level48);
    prefs.setBool('level49', level49);
    prefs.setBool('level40', level40);
  }

  void _reset() {
    setState(() {
      level41 = false;
      level42 = false;
      level43 = false;
      level44 = false;
      level45 = false;
      level46 = false;
      level47 = false;
      level48 = false;
      level49 = false;
      level40 = false;
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
          'Level 4',
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
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Consolidated - alphabetic phase",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aktiftas Pola KVKV”",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              games3 > 79
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 1;
                            _player.dispose();
                            assetName = 'susu';
                            targetImage = 'assets/level4/susu.png';
                            options4 = ["su", "mo", "sa", "su"];
                            answer = [
                              "",
                              "",
                            ];
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
              level41 != false
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

                            assetName = 'sawi';
                            targetImage = 'assets/level4/sawi.png';
                            options4 = ["sa", "ku", "se", "wi"];
                            answer = ["", ""];
                            correctAnswer = ["sa", "wi"];
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
              level42 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 3;
                            _player.dispose();
                            assetName = 'sapu';
                            targetImage = 'assets/level4/sapu.png';
                            options4 = ["pe", "ku", "pu", "sa"];
                            answer = ["", ""];
                            correctAnswer = ["sa", "pu"];
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
              level43 != false
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
                            assetName = 'siku';
                            targetImage = 'assets/level4/siku.png';
                            options4 = ["su", "ku", "ra", "si"];
                            answer = ["", ""];
                            correctAnswer = ["si", "ku"];
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
              level44 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 5;
                            _player.dispose();
                            assetName = 'soda';
                            targetImage = 'assets/level4/soda.png';
                            options4 = ["su", "so", "ba", "da"];
                            answer = ["", ""];
                            correctAnswer = ["so", "da"];
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
              Container(
                width: double.infinity,
                color: Colors.orange,
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
                color: Colors.orange,
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
              level45 != false
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
                            assetName = 'bibir';
                            targetImage = 'assets/level4/bibir.png';
                            options4 = ["be", "bir", "de", "bi"];
                            answer = ["", ""];
                            correctAnswer = ["bi", "bir"];
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
              level46 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 7;
                            _player.dispose();
                            assetName = 'badak';
                            targetImage = 'assets/level4/badak.png';
                            options4 = ["da", "kak", "dak", "ba"];
                            answer = ["", ""];
                            correctAnswer = ["ba", "dak"];
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
              level47 != false
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
                            assetName = 'botol';
                            targetImage = 'assets/level4/botol.png';
                            options4 = ["do", "bo", "lok", "tol"];
                            answer = ["", ""];
                            correctAnswer = ["bo", "tol"];
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
              level48 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            aktivitas2 = 9;
                            _player.dispose();
                            assetName = 'bayam';
                            targetImage = 'assets/level4/bayam.png';
                            options4 = ["yu", "be", "yam", "ba"];
                            answer = ["", ""];
                            correctAnswer = ["ba", "yam"];
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
              level49 != false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _player.dispose();
                            assetName = 'beras';
                            targetImage = 'assets/level4/beras.png';
                            options4 = ["ras", "ba", "gus", "be"];
                            answer = ["", ""];
                            correctAnswer = ["be", "ras"];
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
