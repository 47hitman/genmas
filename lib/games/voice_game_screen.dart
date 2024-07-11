import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../services/globals.dart';

class VoiceGameScreen extends StatefulWidget {
  const VoiceGameScreen({super.key});

  @override
  _VoiceGameScreenState createState() => _VoiceGameScreenState();
}

class _VoiceGameScreenState extends State<VoiceGameScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  final String _targetWord = voice;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    // Level 2 (aktivitas 2 ini dibaca apa).m4a
    _play('assets/level5/Level 5.m4a');
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
        title: const Text('Voice Game'),
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
