import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceGameScreen extends StatefulWidget {
  const VoiceGameScreen({super.key});

  @override
  _VoiceGameScreenState createState() => _VoiceGameScreenState();
}

class _VoiceGameScreenState extends State<VoiceGameScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  final String _targetWord = 'sapu';

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
        onSoundLevelChange: (val) {
          // You can use this to update a UI element with the current sound level
        },
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct! You said: $_spokenText')),
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
              'Say the word: $_targetWord',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              onPressed: _isListening ? _stopListening : _startListening,
              iconSize: 48,
            ),
            const SizedBox(height: 20),
            Text(
              'You said: $_spokenText',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
