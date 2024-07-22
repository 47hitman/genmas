import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../services/globals.dart';

class BerawalnUjianGameScreen extends StatefulWidget {
  const BerawalnUjianGameScreen({Key? key}) : super(key: key);

  @override
  _BerawalnUjianGameScreenState createState() =>
      _BerawalnUjianGameScreenState();
}

class _BerawalnUjianGameScreenState extends State<BerawalnUjianGameScreen> {
  String? selectedOption;
  String? selectedText;

  bool matched = false;
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    super.initState();

    _play(sound);
  }

  void _play(String sound) {
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
    return option == targetImage;
  }

  int incorrectAttempts = 0;
  void _checkAnswer() {
    // Check if targetImage matches any option's image and update targetText
    for (var option in options) {
      if (option['image'] == targetImage) {
        break;
      }
    }
    if (selectedOption != null && _checkIfMatched(selectedOption!)) {
      setState(() {
        matched = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        _showSuccessDialog();
      });
    } else {
      _showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kata Berawalan!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            "assets/background1.png",
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  // if (selectedOption != null)
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 16.0),
                  //     child: Text(
                  //       'Kamu memilih: $selectedOption',
                  //       style: const TextStyle(fontSize: 22, color: Colors.white),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: options.map((option) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = option['image'];
                            selectedText = option['text'];
                            print(selectedText);
                            _play('assets/level3/Level 3 $selectedText.m4a');
                          });
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
                                  fontSize: 18,
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cek Jawaban',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
