import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class BerawalnGameScreen extends StatefulWidget {
  const BerawalnGameScreen({Key? key}) : super(key: key);

  @override
  _BerawalnGameScreenState createState() => _BerawalnGameScreenState();
}

class _BerawalnGameScreenState extends State<BerawalnGameScreen> {
  String? selectedOption;
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
          title: const Text(
            'Selamat!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Kamu berhasil mencocokkan gambar!',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
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

  void _checkAnswer() {
    print(selectedOption);
    print("--------------------");
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
      // Future.delayed(const Duration(seconds: 2), () {
      //   _play('assets/option/Ayo coba lagi.m4a');
      // });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text(
          'Kata Berawalan!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
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
                        _play('assets/level3/Level 3 $selectedOption.m4a');
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
                              color: Colors.white,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cek Jawaban',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
