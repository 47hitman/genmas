import 'package:flutter/material.dart';
import 'package:genmmas/level/level3_kvkv.dart';
import 'package:page_transition/page_transition.dart';
import '../games/kata_pola_screnn.dart';
import '../services/globals.dart';

class level4 extends StatefulWidget {
  const level4({Key? key}) : super(key: key);

  @override
  _level4State createState() => _level4State();
}

String _getImageName(int index) {
  // Menyesuaikan nama gambar sesuai dengan index
  switch (index) {
    case 0:
      return "ular";
    case 1:
      return "tupai";
    case 2:
      return "burung";
    case 3:
      return "kupukupu";
    case 4:
      return "kelinci";
    default:
      return "";
  }
}

String _getText(int index) {
  // Menyesuaikan teks sesuai dengan index
  switch (index) {
    case 0:
      return "ular";
    case 1:
      return "tupai";
    case 2:
      return "burung";
    case 3:
      return "kupukupu";
    case 4:
      return "kelinci";
    default:
      return "";
  }
}

class _level4State extends State<level4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Level 3',
          style: TextStyle(color: Colors.white), // Text warna putih
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Icon (panah kembali) warna putih
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 1",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Kata Pola KVKV",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300, // Ukuran GridView sesuaikan dengan kebutuhan Anda
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Jumlah kolom dalam satu baris
                  mainAxisSpacing: 10, // Spasi antar item secara vertikal
                  crossAxisSpacing: 10, // Spasi antar item secara horizontal
                  childAspectRatio:
                      0.8, // Perbandingan lebar terhadap tinggi setiap item
                ),
                itemCount: 5, // Jumlah item dalam GridView
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Tambahkan logika yang ingin Anda lakukan saat tombol ditekan di sini
                      // print('Tombol ditekan');
                      String imageName = _getImageName(index);
                      assetName = _getText(index);
                      assetLocation = "assets/soal1/$imageName.png";
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const Level3kvkv(),
                        ),
                      );
                      // print('Tombol $assetName ditekan');
                      // print('Lokasi asset gambar: $assetLocation');
                    },
                    child: Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/soal1/${_getImageName(index)}.png",
                            width: 70,
                            height: 60,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _getText(index),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas 2",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Kata Pola KVKVK",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300, // Ukuran GridView sesuaikan dengan kebutuhan Anda
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Jumlah kolom dalam satu baris
                  mainAxisSpacing: 10, // Spasi antar item secara vertikal
                  crossAxisSpacing: 10, // Spasi antar item secara horizontal
                  childAspectRatio:
                      0.8, // Perbandingan lebar terhadap tinggi setiap item
                ),
                itemCount: 5, // Jumlah item dalam GridView
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Tambahkan logika yang ingin Anda lakukan saat tombol ditekan di sini
                      // print('Tombol ditekan');
                      String imageName = _getImageName(index);
                      assetName = _getText(index);
                      assetLocation = "assets/soal1/$imageName.png";
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const Level3kvkv(),
                        ),
                      );
                      // print('Tombol $assetName ditekan');
                      // print('Lokasi asset gambar: $assetLocation');
                    },
                    child: Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/soal1/${_getImageName(index)}.png",
                            width: 70,
                            height: 60,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _getText(index),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
