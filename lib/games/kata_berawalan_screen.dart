import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/level_2_menu.dart';
import '../services/globals.dart';

class BerawalnGameScreen extends StatefulWidget {
  const BerawalnGameScreen({Key? key}) : super(key: key);

  @override
  _BerawalnGameScreenState createState() => _BerawalnGameScreenState();
}

class _BerawalnGameScreenState extends State<BerawalnGameScreen> {
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

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (aktivitas2) {
      case 1:
        prefs.setBool('level21', level21);
        break;
      case 2:
        prefs.setBool('level22', level22);
        break;
      case 3:
        prefs.setBool('level23', level23);
        break;
      case 4:
        prefs.setBool('level24', level24);
        break;
      case 5:
        prefs.setBool('level25', level25);
        break;
      case 6:
        prefs.setBool('level26', level26);
        break;
      case 7:
        prefs.setBool('level27', level27);
        break;
      case 8:
        prefs.setBool('level28', level28);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const menu2level()), // Replace SpecificPage with your target page
                );
                setState(() {
                  matched = false;
                  selectedOption = null;
                });
              },
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
    String targetText = berawalan;
    setState(() {
      switch (aktivitas2) {
        case 1:
          level21 = true;
          break;
        case 2:
          level22 = true;
          break;
        case 3:
          level23 = true;
          break;
        case 4:
          level25 = true;
          break;
        case 5:
          level26 = true;
          break;
        case 6:
          level27 = true;
          break;
        case 7:
          level28 = true;
          break;

        default:
          // print('Invalid aktivitas2 value: $aktivitas2');
          break;
      }
    });
    _saveData();
    // Check if targetImage matches any option's image and update targetText
    for (var option in options) {
      if (option['image'] == targetImage) {
        targetText = option['text']!;
        break;
      }
    }
    if (selectedOption != null && _checkIfMatched(selectedOption!)) {
      setState(() {
        matched = true;
      });
      final List<String> compliments = [
        'assets/option/Bagus.m4a',
        'assets/option/Hebat.m4a',
        'assets/option/Pintar.m4a'
      ];

      Future.delayed(const Duration(seconds: 2), () {
        final randomCompliment =
            compliments[Random().nextInt(compliments.length)];
        _play(randomCompliment);
        _showSuccessDialog();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cocok! Selamat!')),
      );
    } else {
      incorrectAttempts++;
      // Future.delayed(const Duration(seconds: 2), () {
      //   _play('assets/option/Ayo coba lagi.m4a');
      // });
      if (incorrectAttempts > 3) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Bantuan"),
            content: SizedBox(
              width: 30.0, // Sesuaikan lebar dialog sesuai kebutuhan Anda
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    targetImage,
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    targetText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    answer = List.filled(answer.length, "");
                    incorrectAttempts =
                        0; // Reset the counter after showing the hint
                  });
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        _play('assets/option/Ayo coba lagi.m4a');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Tidak cocok, coba lagi ya!'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.blueGrey[600],
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          ),
        );
      }
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
