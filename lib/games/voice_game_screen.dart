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

  void _checkResult() {
    if (_spokenText.toLowerCase() == _targetWord.toLowerCase()) {
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
              },
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect! You said: $_spokenText')),
      );
    }
    setState(() => _spokenText = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Katakan: $_targetWord',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'kamu Mengatakan: $_spokenText',
              style: const TextStyle(fontSize: 24),
            ),
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
                size: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
