import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genmmas/services/globals.dart';

class LengkapiKataScreen extends StatefulWidget {
  const LengkapiKataScreen({Key? key}) : super(key: key);

  @override
  _LengkapiKataScreenState createState() => _LengkapiKataScreenState();
}

class _LengkapiKataScreenState extends State<LengkapiKataScreen> {
  late String kataTersusun;
  late List<String> kataAcak;
  List<bool> sudahDipilih = [];
  int _countdown = 4;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    if (timer != false) {
      _startCountdown();
    }

    // Dummy data untuk contoh
    kataTersusun = assetName;
    kataAcak = _acakHuruf(kataTersusun);
    sudahDipilih = List<bool>.filled(kataTersusun.length, false);
    sudahDipilih[0] = pilih1;
    sudahDipilih[1] = pilih2;
    sudahDipilih[3] = pilih3;
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _countdown = 0;
        });
        _countdownTimer?.cancel();
      }
    });
  }

  List<String> _acakHuruf(String kata) {
    List<String> hurufAcak = kata.split('')..shuffle();
    List<String> kataAcak = List.from(hurufAcak);

    // Jika ada huruf acak yang sama dengan kata tersusun, cari lagi
    for (int i = 0; i < kata.length; i++) {
      if (hurufAcak[i] == kata[i]) {
        int j = i + 1;
        while (j < kata.length && hurufAcak[j] == kata[j]) {
          j++;
        }
        if (j < kata.length) {
          String temp = hurufAcak[i];
          hurufAcak[i] = hurufAcak[j];
          hurufAcak[j] = temp;
        }
      }
    }

    return hurufAcak;
  }

  void _pilihHuruf(int index) {
    setState(() {
      int nextIndex = sudahDipilih.indexWhere((e) => !e);
      if (nextIndex != -1 &&
          index == kataAcak.indexOf(kataTersusun[nextIndex])) {
        sudahDipilih[nextIndex] = true;

        // Cek apakah semua huruf sudah dipilih dengan benar
        if (_cekPenyelesaian()) {
          _showDialogKataBerhasilDisusun();
        }
      } else {
        _showSnackBar('Pilih huruf berikutnya yang benar');
      }
    });
  }

  bool _cekPenyelesaian() {
    return sudahDipilih.every((element) => element);
  }

  void _reset() {
    setState(() {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      kataAcak.shuffle();
      sudahDipilih = List<bool>.filled(kataTersusun.length, false);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showDialogKataBerhasilDisusun() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selamat!'),
          content: const Text('Kata berhasil disusun!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menyusun Huruf Menjadi Kata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (timer != false)
              if (_countdown > 0)
                Text(
                  'Tunggu $_countdown detik...',
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
            // Ganti dengan gambar yang relevan
            assetLocation != null
                ? Image.asset(assetLocation, width: 100, height: 80)
                : Container(),
            if (_countdown > 0)
              Text(
                kataTersusun,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 16),

            // Kolom huruf acak

            // Kolom untuk menyusun kata

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(kataTersusun.length, (index) {
                return GestureDetector(
                  onTap: sudahDipilih[index]
                      ? null
                      : () {
                          _pilihHuruf(index);
                        },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      sudahDipilih[index] ? kataTersusun[index] : '',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(kataAcak.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _pilihHuruf(index);
                  },
                  child: Chip(
                    backgroundColor: Colors.grey,
                    label: Text(
                      kataAcak[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
