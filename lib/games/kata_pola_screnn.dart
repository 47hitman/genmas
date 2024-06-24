import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../services/globals.dart';

class KataPola extends StatefulWidget {
  const KataPola({Key? key}) : super(key: key);

  @override
  _KataPolaState createState() => _KataPolaState();
}

class _KataPolaState extends State<KataPola> {
  bool _showInitialScreen = true;
  bool _showSecondScreen = false;
  bool _showSuccessDialog = false;
  int _selectedCount = 0; // Menghitung berapa kali kata 'susu' telah dipilih

  @override
  void initState() {
    super.initState();
    _startTimer();
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

  void _startTimer() {
    // Tunggu selama 5 detik sebelum menampilkan layar kedua
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _showInitialScreen = false;
        _showSecondScreen = true;
        // _play(sound);
        String selectedOption = kvkv;
        if (selectedOption == 'susu') {
          _play('assets/level2/Level 2 (aktivitas 2a tunjuk kata susu).m4a');
        }
        if (selectedOption == 'sawi') {
          _play('assets/level2/Level 2 (aktivitas 2a tunjuk kata sawi).m4a');
        }

        if (selectedOption == 'sapu') {
          _play('assets/level2/Level 2 (aktivitas 2a tunjuk kata sapu).m4a');
        }

        if (selectedOption == 'siku') {
          _play('assets/level2/Level 2 (aktivitas 2a tunjuk kata siku).m4a');
        }

        if (selectedOption == 'soda') {
          _play('assets/level2/Level 2 (aktivitas 2a tunjuk kata soda).m4a');
        }
        if (selectedOption == 'bibir') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata bibir).m4a');
        }
        if (selectedOption == 'beras') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata beras).m4a');
        }
        if (selectedOption == 'beras') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata beras).m4a');
        }
        if (selectedOption == 'badak') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata badak).m4a');
        }
        if (selectedOption == 'bayam') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata bayam).m4a');
        }
        if (selectedOption == 'botol') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata botol).m4a');
        }
        if (selectedOption == 'bedak') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata bedak).m4a');
        }
        if (selectedOption == 'bedak') {
          _play('assets/level2/Level 2 (aktivitas 2c tunjuk kata bedak).m4a');
        }
      });
    });
  }

  void _onWordSelected(String word) {
    // Cek apakah kata yang dipilih benar
    if (word == kvkv) {
      setState(() {
        _selectedCount++; // Tambahkan satu ke hitungan kata 'susu'
        if (_selectedCount == 2) {
          _showSuccessDialog =
              true; // Tampilkan dialog jika kata 'susu' sudah dipilih dua kali
          _showSecondScreen =
              false; // Sembunyikan layar kedua setelah dialog muncul
          _selectedCount = 0; // Reset hitungan setelah berhasil
        }
      });

      // Jika belum dua kali dipilih, acak dua kali kata yang harus dipilih lagi
      if (_selectedCount < 2) {
        _randomizeButtons(); // Acak tombol lagi
      }
    } else {
      // Jika kata yang dipilih salah
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pilihan Salah'),
            content: Text('Anda memilih kata yang salah. Pilih kata $kvkv.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Fungsi untuk mengacak posisi tombol
  void _randomizeButtons() {
    setState(() {
      // Generate dua indeks acak dari 0 sampai 2 (indeks untuk 'susu', 'air', 'roti')
      List<int> randomIndexes = [0, 1, 2];
      randomIndexes.shuffle(); // Acak indeks
      // Urutkan kembali tombol berdasarkan indeks acak
      _buttonTexts.shuffle();
    });
  }

  // Daftar teks untuk tombol pada layar kedua
  final List<String> _buttonTexts = [kvkv, option2, option3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kata Pola $appbar'),
      ),
      body: Center(
        child: _showInitialScreen
            ? _buildInitialScreen()
            : _showSecondScreen
                ? _buildSecondScreen()
                : _buildSuccessDialog(),
      ),
    );
  }

  Widget _buildInitialScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Ini dibaca $kvkv, ini dibaca apa',
        //   style: const TextStyle(fontSize: 20),
        // ),
        const SizedBox(height: 20),
        Text(
          kvkv,
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildSecondScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Tunjuk kata $kvkv! Pilih kata yang benar:',
        //   style: const TextStyle(fontSize: 20),
        // ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[0]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ), // Index 0
              child: Text(
                _buttonTexts[0],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[1]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ), // Index 1
              child: Text(
                _buttonTexts[1],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onWordSelected(_buttonTexts[2]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ), // Index 2
              child: Text(
                _buttonTexts[2],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSuccessDialog() {
    return AlertDialog(
      title: const Text('Pilihan berhasil!'),
      content: Text('Anda telah berhasil memilih kata $kvkv dua kali.'),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _showInitialScreen = true;
              _showSuccessDialog = false;
            });
            _startTimer(); // Mulai timer lagi untuk menampilkan layar kedua
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
