import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/globals.dart';

class SingleImageMatchingUjianGameScreen extends StatefulWidget {
  const SingleImageMatchingUjianGameScreen({Key? key}) : super(key: key);

  @override
  _SingleImageMatchingUjianGameScreenState createState() =>
      _SingleImageMatchingUjianGameScreenState();
}

class _SingleImageMatchingUjianGameScreenState
    extends State<SingleImageMatchingUjianGameScreen> {
  String? selectedOption;
  bool matched = false;

  @override
  void initState() {
    super.initState();
    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.orange.shade100,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Soal Selanjutnya!',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _checkIfMatched(String option) {
    return option ==
        targetImage; // Ganti dengan path gambar target yang sebenarnya
  }

  void _play2(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text(
          'Pasangkan Gambar!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/background 6.png",
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Opacity(
                  opacity: matched ? 1.0 : 0.5,
                  child: Image.asset(
                    targetImage == "assets/level1/aktivitas3/buku.png"
                        ? "assets/level1/aktivitas3/bukusamar.png"
                        : targetImage == "assets/level1/aktivitas3/kucing.png"
                            ? "assets/level1/aktivitas3/kucingsamar.png"
                            : targetImage == "assets/level1/aktivitas3/b.png"
                                ? "assets/level1/aktivitas3/bsamar.png"
                                : targetImage, // Default to targetImage if no match
                    width: 120,
                    height: 120,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: options.map((option) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option['image'];
                        });
                        if (_checkIfMatched(option['image']!)) {
                          setState(() {
                            matched = true;
                          });
                          for (int i = 1; i <= 10; i++) {
                            if (ujian == i) {
                              switch (i) {
                                case 1:
                                  ujian1 = true;
                                  soalujian1 = true;
                                  break;
                                case 2:
                                  ujian2 = true;
                                  soalujian2 = true;
                                  break;
                                case 3:
                                  ujian3 = true;
                                  soalujian3 = true;
                                  break;
                                case 4:
                                  ujian4 = true;
                                  soalujian4 = true;
                                  break;
                                case 5:
                                  ujian5 = true;
                                  soalujian5 = true;
                                  break;
                                case 6:
                                  ujian6 = true;
                                  soalujian6 = true;
                                  break;
                                case 7:
                                  ujian7 = true;
                                  soalujian7 = true;
                                  break;
                                case 8:
                                  ujian8 = true;
                                  soalujian8 = true;
                                  break;
                                case 9:
                                  ujian9 = true;
                                  soalujian9 = true;
                                  break;
                                case 10:
                                  ujian10 = true;
                                  soalujian10 = true;
                                  break;
                              }
                            }
                          }
                          _showSuccessDialog();
                        } else {
                          for (int i = 1; i <= 10; i++) {
                            if (ujian == i) {
                              switch (i) {
                                case 1:
                                  ujian1 = false;
                                  soalujian1 = true;
                                  break;
                                case 2:
                                  ujian2 = false;
                                  soalujian2 = true;
                                  break;
                                case 3:
                                  ujian3 = false;
                                  soalujian3 = true;
                                  break;
                                case 4:
                                  ujian4 = false;
                                  soalujian4 = true;
                                  break;
                                case 5:
                                  ujian5 = false;
                                  soalujian5 = true;
                                  break;
                                case 6:
                                  ujian6 = false;
                                  soalujian6 = true;
                                  break;
                                case 7:
                                  ujian7 = false;
                                  soalujian7 = true;
                                  break;
                                case 8:
                                  ujian8 = false;
                                  soalujian8 = true;
                                  break;
                                case 9:
                                  ujian9 = false;
                                  soalujian9 = true;
                                  break;
                                case 10:
                                  ujian10 = false;
                                  soalujian10 = true;
                                  break;
                              }
                            }
                          }
                          _showSuccessDialog();
                        }
                      },
                      child: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedOption == option['image']
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              option['image']!,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              option['text']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
