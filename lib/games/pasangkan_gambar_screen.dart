import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_1_menu.dart';
import '../services/globals.dart';

class SingleImageMatchingGameScreen extends StatefulWidget {
  const SingleImageMatchingGameScreen({Key? key}) : super(key: key);

  @override
  _SingleImageMatchingGameScreenState createState() =>
      _SingleImageMatchingGameScreenState();
}

class _SingleImageMatchingGameScreenState
    extends State<SingleImageMatchingGameScreen> {
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

  // void _checkCompletion() {
  //   if (matched) {
  //     _showSuccessDialog();
  //   }
  // }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (aktivitas3) {
      case 1:
        prefs.setBool('aktivast31', aktivast31);
        break;
      case 2:
        prefs.setBool('aktivast32', aktivast32);
        break;
      case 3:
        prefs.setBool('aktivast33', aktivast33);
        break;

      default:
        // print('Invalid aktivitas2 value: $aktivitas2');
        break;
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                'Selamat!',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/poin.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                '10',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  switch (aktivitas3) {
                    case 1:
                      aktivast31 = true;
                      break;
                    case 2:
                      aktivast32 = true;
                      break;
                    case 3:
                      aktivast33 = true;
                      break;
                    default:
                      break;
                  }
                  matched = false;
                  selectedOption = null;
                });
                _saveData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const menu1level()), // Replace SpecificPage with your target page
                );
              },
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
                          final List<String> compliments = [
                            'assets/option/Bagus.m4a',
                            'assets/option/Hebat.m4a',
                            'assets/option/Pintar.m4a'
                          ];
                          final randomCompliment =
                              compliments[Random().nextInt(compliments.length)];
                          _play2(randomCompliment);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cocok! Selamat!')),
                          );
                          _showSuccessDialog();
                        } else {
                          _play2('assets/option/Ayo coba lagi.m4a');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Tidak cocok, coba lagi ya!'),
                              behavior: SnackBarBehavior
                                  .floating, // Optional: Floating behavior
                              shape: RoundedRectangleBorder(
                                // Optional: Custom shape
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.blueGrey[
                                  600], // Optional: Custom background color
                              duration: const Duration(
                                  seconds:
                                      2), // Optional: Duration for how long snackbar will be visible
                              action: SnackBarAction(
                                // Optional: For adding an action button
                                label: 'OK',
                                onPressed: () {
                                  // Do something when OK is pressed
                                },
                              ),
                            ),
                          );
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
