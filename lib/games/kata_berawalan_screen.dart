import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class berawalnGameScreen extends StatefulWidget {
  const berawalnGameScreen({Key? key}) : super(key: key);

  @override
  _berawalnGameScreenState createState() => _berawalnGameScreenState();
}

class _berawalnGameScreenState extends State<berawalnGameScreen> {
  String? selectedOption;
  bool matched = false;
  @override
  void initState() {
    super.initState();
    _play(sound);
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
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
    return option ==
        targetImage; // Ganti dengan path gambar target yang sebenarnya
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Ayo tunjukkan kata yang berawalan "$berawalan"',
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option['text'];
                        print(selectedOption);
                        if (selectedOption == 'soda') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2a ini dibaca soda).m4a');
                        }
                        if (selectedOption == 'bibir') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2c ini dibaca bibir).m4a');
                        }
                        if (selectedOption == 'sapu') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2a ini dibaca sapu).m4a');
                        }
                        if (selectedOption == 'botol') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2c ini dibaca botol).m4a');
                        }
                        if (selectedOption == 'siku') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2a ini dibaca siku).m4a');
                        }
                        if (selectedOption == 'badak') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2c ini dibaca badak).m4a');
                        }
                        if (selectedOption == 'beras') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2c ini dibaca beras).m4a');
                        }
                        if (selectedOption == 'bayam') {
                          _play(
                              'assets/level2/Level 2 (aktivitas 2c ini dibaca bayam).m4a');
                        }
                      });
                      if (_checkIfMatched(option['image']!)) {
                        setState(() {
                          matched = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cocok! Selamat!')),
                        );
                        _showSuccessDialog();
                      } else {
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
            ],
          ),
        ),
      ),
    );
  }
}
