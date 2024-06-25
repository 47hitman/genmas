import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/level_1_menu.dart';
import '../models/image_find_item.dart';
import 'dart:async';

import '../services/globals.dart';

class CariGambarScreen extends StatefulWidget {
  const CariGambarScreen({super.key});

  @override
  _CariGambarScreenState createState() => _CariGambarScreenState();
}

class _CariGambarScreenState extends State<CariGambarScreen> {
  ImageFindItem? _firstSelected;
  ImageFindItem? _secondSelected;
  bool _isProcessing = false;
  int _score = 0;
  int _countdown = 4;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _initializeGame();
    _startCountdown();
    _play();
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play() {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('aktivast4', aktivast4);
  }

  void _initializeGame() {
    imageItems.shuffle();
  }

  void _startCountdown() {
    _flipAllCards();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _countdown = 0;
          _flipAllCards(flip: false);
        });
        _countdownTimer?.cancel();
      }
    });
  }

  void _flipAllCards({bool flip = true}) {
    setState(() {
      for (var item in imageItems) {
        item.isFlipped = flip;
      }
    });
  }

  void _onCardTapped(ImageFindItem item) {
    if (_isProcessing || item.isFlipped || _countdown > 0) return;

    setState(() {
      item.isFlipped = true;
    });

    if (_firstSelected == null) {
      _firstSelected = item;
    } else {
      _secondSelected = item;
      _isProcessing = true;

      if (_firstSelected!.imagePath == _secondSelected!.imagePath) {
        setState(() {
          _score += 10;
        });
        _resetSelection();
        _checkIfGameCompleted();
      } else {
        Timer(const Duration(seconds: 1), () {
          setState(() {
            _firstSelected!.isFlipped = false;
            _secondSelected!.isFlipped = false;
            _showErrorDialog();
          });
          _resetSelection();
        });
      }
    }
  }

  void _resetSelection() {
    _firstSelected = null;
    _secondSelected = null;
    _isProcessing = false;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 10),
              Text('Salah',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text('Gambar tidak cocok, coba lagi!',
              style: TextStyle(fontSize: 18)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Berhasil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text('Semua gambar cocok, bagus sekali!',
              style: TextStyle(fontSize: 18)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  aktivast4 = true;
                });
                _saveData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const menu1level()), // Replace SpecificPage with your target page
                );
              },
              child: const Text('OK', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

  void _checkIfGameCompleted() {
    if (imageItems.every((item) => item.isFlipped)) {
      _showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: const Text(
          'Cari Gambar Memory',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Skor: $_score',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                if (_countdown > 0)
                  Text(
                    'Tunggu $_countdown detik...',
                    style: const TextStyle(fontSize: 24, color: Colors.red),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: imageItems.length,
              itemBuilder: (context, index) {
                final item = imageItems[index];
                return GestureDetector(
                  onTap: () => _onCardTapped(item),
                  child: Card(
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: item.isFlipped
                          ? Image.asset(item.imagePath)
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}
