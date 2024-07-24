import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../services/globals.dart';

class KataPolaUjian extends StatefulWidget {
  const KataPolaUjian({Key? key}) : super(key: key);

  @override
  _KataPolaUjianState createState() => _KataPolaUjianState();
}

class _KataPolaUjianState extends State<KataPolaUjian> {
  String selectedOption = kvkv;
  @override
  void initState() {
    super.initState();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
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
        for (int i = 1; i <= 10; i++) {
          if (ujian == i) {
            switch (i) {
              case 1:
                ujian1 = true;
                break;
              case 2:
                ujian2 = true;
                break;
              case 3:
                ujian3 = true;
                break;
              case 4:
                ujian4 = true;
                break;
              case 5:
                ujian5 = true;
                break;
              case 6:
                ujian6 = true;
                break;
              case 7:
                ujian7 = true;
                break;
              case 8:
                ujian8 = true;
                break;
              case 9:
                ujian9 = true;
                break;
              case 10:
                ujian10 = true;
                break;
            }
          }
        }
        showSuccessDialogWidget();
      });
    } else {
      for (int i = 1; i <= 10; i++) {
        if (ujian == i) {
          switch (i) {
            case 1:
              ujian1 = false;
              break;
            case 2:
              ujian2 = false;
              break;
            case 3:
              ujian3 = false;
              break;
            case 4:
              ujian4 = false;
              break;
            case 5:
              ujian5 = false;
              break;
            case 6:
              ujian6 = false;
              break;
            case 7:
              ujian7 = false;
              break;
            case 8:
              ujian8 = false;
              break;
            case 9:
              ujian9 = false;
              break;
            case 10:
              ujian10 = false;
              break;
          }
        }
      }
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
          ],
        )
      ],
    );
  }

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
