import 'package:flutter/material.dart';

class LengkapiKataScreen extends StatefulWidget {
  const LengkapiKataScreen({Key? key}) : super(key: key);

  @override
  _LengkapiKataScreenState createState() => _LengkapiKataScreenState();
}

class _LengkapiKataScreenState extends State<LengkapiKataScreen> {
  late String kataTersusun;
  late List<String> kataAcak;
  List<bool> sudahDipilih = [];

  @override
  void initState() {
    super.initState();
    // Ganti dengan daftar kata yang ingin digunakan
    kataTersusun = 'SAPU';
    kataAcak = _acakHuruf(kataTersusun);
    sudahDipilih = List<bool>.filled(kataTersusun.length, false);
    sudahDipilih[0] = true;
    sudahDipilih[1] = true;
    sudahDipilih[3] = true;
  }

  List<String> _acakHuruf(String kata) {
    List<String> hurufAcak = kata.split('')..shuffle();
    List<String> kataAcak = List.from(hurufAcak); // Salin hurufAcak ke kataAcak

    // Jika ada huruf acak yang sama dengan kata tersusun, cari lagi
    for (int i = 0; i < kata.length; i++) {
      if (hurufAcak[i] == kata[i]) {
        // Cari huruf acak yang berbeda dari kata tersusun
        int j = i + 1;
        while (j < kata.length && hurufAcak[j] == kata[j]) {
          j++;
        }
        if (j < kata.length) {
          // Tukar huruf acak dengan huruf yang berbeda
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kata berhasil disusun!')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pilih huruf berikutnya yang benar')),
        );
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
            // Gambar (ganti dengan gambar yang relevan)
            Image.asset(
              'assets/icon2.png', // Ganti dengan path gambar
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            Text(
              kataTersusun,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Kolom huruf acak
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
            // Kolom untuk menyusun kata
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(kataTersusun.length, (index) {
                return Container(
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
                );
              }),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
