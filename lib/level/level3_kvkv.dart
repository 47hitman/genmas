import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/games/lengkapi_kata_screen.dart';
import 'package:genmmas/level/level_3.dart';
import 'package:page_transition/page_transition.dart';

import '../menu/level_3_menu.dart';
import '../services/globals.dart';

class Level3kvkv extends StatefulWidget {
  const Level3kvkv({Key? key}) : super(key: key);

  @override
  _Level3kvkvState createState() => _Level3kvkvState();
}

Map<String, List<bool>> assetMap = {};

class _Level3kvkvState extends State<Level3kvkv> {
  @override
  void initState() {
    super.initState();
    String selectedOption = assetName;
    if (selectedOption == 'susu') {
      _play('assets/level3/Level 3 susu.m4a');
    }
    if (selectedOption == 'sawi') {
      _play('assets/level3/Level 3 sawi.m4a');
    }
    if (selectedOption == 'sapu') {
      _play('assets/level3/Level 3 sapu.m4a');
    }

    if (selectedOption == 'siku') {
      _play('assets/level3/Level 3 siku.m4a');
    }

    if (selectedOption == 'soda') {
      _play('assets/level3/Level 3 soda.m4a');
    }
    if (selectedOption == 'bibir') {
      _play('assets/level3/Level 3 bibir.m4a');
    }
    if (selectedOption == 'badak') {
      _play('assets/level3/Level 3 badak.m4a');
    }
    if (selectedOption == 'botol') {
      _play('assets/level3/Level 3 botol.m4a');
    }
    if (selectedOption == 'bayam') {
      _play('assets/level3/Level 3 bayam.m4a');
    }
    if (selectedOption == 'beras') {
      _play('assets/level3/Level 3 beras.m4a');
    }
    assetMap = {
      'susu': [susu1, susu2, susu3, susu4, susu5, susu6],
      'sapu': [sapu1, sapu2, sapu3, sapu4, sapu5, sapu6],
      'siku': [siku1, siku2, siku3, siku4, siku5, siku6],
      'soda': [soda1, soda2, soda3, soda4, soda5, soda6],
      'bibir': [bibir1, bibir2, bibir3, bibir4, bibir5, bibir6],
      'badak': [badak1, badak2, badak3, badak4, badak5, badak6],
      'botol': [botol1, botol2, botol3, botol4, botol5, botol6],
      'bayam': [bayam1, bayam2, bayam3, bayam4, bayam5, bayam6],
      'beras': [beras1, beras2, beras3, beras4, beras5, beras6],
    };
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<bool> assetConditions =
        assetMap[assetName] ?? [false, false, false, false, false, false];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Menyusun Huruf Menjadi Kata ',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const menu3level()), // Replace SpecificPage with your target page
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background 6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 144, 114, 104),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Replace with your asset or placeholder
                    Image.asset(
                      assetLocation, // Example asset path
                      width: 100,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      assetName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    assetName == 'susu' ? awal = true : awal = false;
                    soal1 = true;
                    soal2 = false;
                    soal3 = false;
                    soal4 = false;
                    soal5 = false;
                    soal6 = false;
                    pilih1 = false;
                    pilih2 = false;
                    pilih3 = false;
                    pilih4 = false;
                    timer = false;
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const LengkapiKataScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 1',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: assetConditions[0]
                      ? () {
                          soal1 = false;
                          soal2 = true;
                          soal3 = false;
                          soal4 = false;
                          soal5 = false;
                          soal6 = false;
                          assetName != 'susu' ? awal = true : awal = false;
                          pilih1 = false;
                          pilih2 = false;
                          pilih3 = false;
                          pilih4 = false;
                          timer = true;
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const LengkapiKataScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 2',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: assetConditions[1]
                      ? () {
                          soal1 = false;
                          soal2 = false;
                          soal3 = true;
                          soal4 = false;
                          soal5 = false;
                          soal6 = false;
                          assetName != 'susu' ? awal = true : awal = false;
                          pilih1 = false;
                          pilih2 = true;
                          pilih3 = true;
                          pilih4 = true;
                          timer = false;
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const LengkapiKataScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 3',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: assetConditions[2]
                      ? () {
                          assetName != 'susu' ? awal = true : awal = false;
                          soal1 = false;
                          soal2 = false;
                          soal3 = false;
                          soal4 = true;
                          soal5 = false;
                          soal6 = false;
                          pilih1 = false;
                          pilih2 = true;
                          pilih3 = false;
                          pilih4 = true;
                          timer = false;
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const LengkapiKataScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 4',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: assetConditions[3]
                      ? () {
                          soal1 = false;
                          soal2 = false;
                          soal3 = false;
                          soal4 = false;
                          soal5 = true;
                          soal6 = false;
                          assetName != 'susu' ? awal = true : awal = false;
                          pilih1 = false;
                          pilih2 = true;
                          pilih3 = false;
                          pilih4 = false;
                          timer = false;
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const LengkapiKataScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 5',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: assetConditions[4]
                      ? () {
                          soal1 = false;
                          soal2 = false;
                          soal3 = false;
                          soal4 = false;
                          soal5 = false;
                          soal6 = true;
                          assetName != 'susu' ? awal = true : awal = false;
                          pilih1 = false;
                          pilih2 = false;
                          pilih3 = false;
                          pilih4 = false;
                          timer = false;
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: const LengkapiKataScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 212, 42),
                  ),
                  child: const Text('Soal 6',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
