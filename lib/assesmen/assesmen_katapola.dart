import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class KataPolaAsesment extends StatefulWidget {
  const KataPolaAsesment({Key? key}) : super(key: key);

  @override
  _KataPolaAsesmentState createState() => _KataPolaAsesmentState();
}

class _KataPolaAsesmentState extends State<KataPolaAsesment> {
  String selectedOption = kvkv;
  @override
  void initState() {
    super.initState();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio.network(
        sound, // Ganti dengan URL audio dari internet
      ),
      autoStart: true,
      showNotification: true,
    );
  }

  void playSound() async {
    _play(sound);
  }

  void _onWordSelected(String word) {
    if (word == kvkv) {
      setState(() {
        showSuccessDialogWidget();
      });
    } else {
      showSuccessDialogWidget();
    }
  }

  final List<String> _buttonTexts = [kvkv, option2, option3, option4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kata Pola $appbar'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: _buildSecondScreen()),
      ),
    );
  }

  Widget _buildSecondScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up, size: 50, color: Colors.blue),
          onPressed: playSound,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[0]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ), // Index 0
              child: Text(
                _buttonTexts[0],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[1]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ), // Index 1
              child: Text(
                _buttonTexts[1],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[2]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ), // Index 2
              child: Text(
                _buttonTexts[2],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[2]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ), // Index 2
              child: Text(
                _buttonTexts[3],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }

  // void _buildSuccessDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Success'),
  //         content: Text('Anda telah berhasil memilih kata $kvkv dua kali.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               setState(() {
  //                 _showInitialScreen = true;
  //                 _showSuccessDialog = false;
  //               });
  //               Navigator.of(context).pop();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void showSuccessDialogWidget() {
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
                  setState(() {
                    // _showInitialScreen = true;
                    // _showSuccessDialog = false;
                  });
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
}
