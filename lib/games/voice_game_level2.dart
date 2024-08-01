import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../services/globals.dart';

class VoiceGameScreen2 extends StatefulWidget {
  const VoiceGameScreen2({super.key});

  @override
  _VoiceGameScreen2State createState() => _VoiceGameScreen2State();
}

class _VoiceGameScreen2State extends State<VoiceGameScreen2> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  final String _targetWord = voice;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    // Level 2 (aktivitas 2 ini dibaca apa).m4a
    _play('assets/level2/Level 2 (aktivitas 2 ini dibaca apa).m4a');
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
      case 9:
        prefs.setBool('level29', level29);
        break;
      case 10:
        prefs.setBool('level210', level210);
        break;
      case 11:
        prefs.setBool('level211', level211);
        break;
      case 12:
        prefs.setBool('level212', level212);
        break;
      case 13:
        prefs.setBool('level213', level213);
        break;
      case 14:
        prefs.setBool('level214', level214);
        break;
      case 15:
        prefs.setBool('level215', level215);
        break;
      case 16:
        prefs.setBool('level216', level216);
        break;
      case 17:
        prefs.setBool('level217', level217);
        break;
      case 18:
        prefs.setBool('level218', level218);
        break;
      case 19:
        prefs.setBool('level219', level219);
        break;
      case 20:
        prefs.setBool('level220', level220);
        break;
      case 21:
        prefs.setBool('level221', level221);
        break;
      case 22:
        prefs.setBool('level222', level222);
        break;
      case 23:
        prefs.setBool('level223', level223);
        break;
      case 24:
        prefs.setBool('level224', level224);
        break;
      case 25:
        prefs.setBool('level225', level225);
        break;
      case 26:
        prefs.setBool('level226', level226);
        break;
      case 27:
        prefs.setBool('level227', level227);
        break;
      case 28:
        prefs.setBool('level228', level228);
        break;
      case 29:
        prefs.setBool('level229', level229);
        break;
      case 30:
        prefs.setBool('level230', level230);
        break;
      default:
        // print('Invalid aktivitas2 value: $aktivitas2');
        break;
    }
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _spokenText = val.recognizedWords;
          if (!_isListening) {
            _checkResult();
          }
        }),
        listenFor: const Duration(seconds: 5),
        cancelOnError: true,
        listenMode: stt.ListenMode.confirmation,
      );
    } else {
      setState(() => _isListening = false);
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
    _checkResult();
  }

  int incorrectAttempts = 0; // Initialize the counter

  void _checkResult() {
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
          level24 = true;
          break;
        case 5:
          level25 = true;
          break;
        case 6:
          level26 = true;
          break;
        case 7:
          level27 = true;
          break;
        case 8:
          level28 = true;
          break;
        case 9:
          level29 = true;
          break;
        case 10:
          level210 = true;
          break;
        case 11:
          level211 = true;
          break;
        case 12:
          level212 = true;
          break;
        case 13:
          level213 = true;
          break;
        case 14:
          level214 = true;
          break;
        case 15:
          level215 = true;
          break;
        case 16:
          level216 = true;
          break;
        case 17:
          level217 = true;
          break;
        case 18:
          level218 = true;
          break;
        case 19:
          level219 = true;
          break;
        case 20:
          level220 = true;
          break;
        case 21:
          level221 = true;
          break;
        case 22:
          level222 = true;
          break;
        case 23:
          level223 = true;
          break;
        case 24:
          level224 = true;
          break;
        case 25:
          level225 = true;
          break;
        case 26:
          level226 = true;
          break;
        case 27:
          level227 = true;
          break;
        case 28:
          level228 = true;
          break;
        case 29:
          level229 = true;
          break;
        case 30:
          level230 = true;
          break;
        default:
          // print('Invalid aktivitas2 value: $aktivitas2');
          break;
      }
    });

    _saveData();
    if (_spokenText.toLowerCase() == _targetWord.toLowerCase()) {
      final List<String> compliments = [
        'assets/option/Bagus.m4a',
        'assets/option/Hebat.m4a',
        'assets/option/Pintar.m4a'
      ];
      Future.delayed(const Duration(seconds: 2), () {
        final randomCompliment =
            compliments[Random().nextInt(compliments.length)];
        _play(randomCompliment);
      });
      incorrectAttempts = 0;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Betul!'),
          // content: Text('You said: $_spokenText'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      incorrectAttempts++; // Increment the counter on incorrect answer

      if (incorrectAttempts > 3) {
        String selectedOption = _targetWord;
        if (selectedOption == 'susu') {
          _play('assets/level2/Level 2 (aktivitas 2a ini dibaca susu).m4a');
        }
        if (selectedOption == 'sawi') {
          _play('assets/level2/Level 2 (aktivitas 2a ini dibaca sawi).m4a');
        }

        if (selectedOption == 'sapu') {
          _play('assets/level2/Level 2 (aktivitas 2a ini dibaca sapu).m4a');
        }

        if (selectedOption == 'siku') {
          _play('assets/level2/Level 2 (aktivitas 2a ini dibaca siku).m4a');
        }

        if (selectedOption == 'soda') {
          _play('assets/level2/Level 2 (aktivitas 2a ini dibaca soda).m4a');
        }
        if (selectedOption == 'bibir') {
          _play('assets/level2/Level 2 (aktivitas 2c ini dibaca bibir).m4a');
        }
        if (selectedOption == 'beras') {
          _play('assets/level2/Level 2 (aktivitas 2c ini dibaca beras).m4a');
        }

        if (selectedOption == 'badak') {
          _play('aassets/level2/Level 2 (aktivitas 2c ini dibaca badak).m4a');
        }
        if (selectedOption == 'bayam') {
          _play('assets/level2/Level 2 (aktivitas 2c ini dibaca bayam).m4a');
        }
        if (selectedOption == 'botol') {
          _play('assets/level2/Level 2 (aktivitas 2c ini dibaca botol).m4a');
        }
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          _play('assets/option/Ayo coba lagi.m4a');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect! You said: $_spokenText')),
        );
      }
    }
    setState(() => _spokenText = '');
  }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _targetWord,
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 20),
              // Text(
              //   'kamu Mengatakan: $_spokenText',
              //   style: const TextStyle(fontSize: 24),
              // ),
              const SizedBox(height: 200),
              GestureDetector(
                onLongPressStart: (details) {
                  _startListening();
                },
                onLongPressEnd: (details) {
                  _stopListening();
                },
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
