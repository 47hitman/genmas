import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../services/globals.dart';

class VoiceGameAssesmentScreen extends StatefulWidget {
  const VoiceGameAssesmentScreen({super.key});

  @override
  _VoiceGameAssesmentScreenState createState() =>
      _VoiceGameAssesmentScreenState();
}

class _VoiceGameAssesmentScreenState extends State<VoiceGameAssesmentScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  final String _targetWord = voice;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    // Level 2 (aktivitas 2 ini dibaca apa).m4a
    // _play('assets/level5/Level 5.m4a');
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
    } else {
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
    setState(() => _spokenText = '');
  }

  void playSound() async {}
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
              IconButton(
                icon: const Icon(Icons.volume_up, size: 50, color: Colors.blue),
                onPressed: playSound,
              ),
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
