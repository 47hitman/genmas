import 'package:flutter/material.dart';
import 'package:genmmas/level/level3_kvkv.dart';
import 'package:page_transition/page_transition.dart';
import '../games/kata_pola_screnn.dart';
import '../services/globals.dart';

class level3 extends StatefulWidget {
  const level3({Key? key}) : super(key: key);

  @override
  _level3State createState() => _level3State();
}

String _getImageName(int index) {
  // Menyesuaikan nama gambar sesuai dengan index
  switch (index) {
    case 0:
      return "susu";
    case 1:
      return "sawi";
    case 2:
      return "sapu";
    case 3:
      return "siku";
    case 4:
      return "soda";
    default:
      return "";
  }
}

String _getText(int index) {
  // Menyesuaikan teks sesuai dengan index
  switch (index) {
    case 0:
      return "susu";
    case 1:
      return "sawi";
    case 2:
      return "sapu";
    case 3:
      return "siku";
    case 4:
      return "soda";
    default:
      return "";
  }
}

String _getImageName2(int index) {
  switch (index) {
    case 0:
      return "bibir";
    case 1:
      return "badak";
    case 2:
      return "botol";
    case 3:
      return "bayam";
    case 4:
      return "beras";
    default:
      return "";
  }
}

String _getText2(int index) {
  // Menyesuaikan teks sesuai dengan index
  switch (index) {
    case 0:
      return "bibir";
    case 1:
      return "badak";
    case 2:
      return "botol";
    case 3:
      return "bayam";
    case 4:
      return "beras";
    default:
      return "";
  }
}

class _level3State extends State<level3> {
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
                      assetLocation = "assets/level3/aktivitas1/$imageName.png";
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
                            "assets/level3/aktivitas1/${_getImageName(index)}.png",
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
                      String imageName = _getImageName2(index);
                      assetName = _getText2(index);
                      assetLocation = "assets/level3/aktivitas2/$imageName.png";
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
                            "assets/level3/aktivitas2/${_getImageName2(index)}.png",
                            width: 70,
                            height: 60,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _getText2(index),
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