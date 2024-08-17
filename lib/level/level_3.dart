import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/games_screen.dart';
import 'package:genmmas/level/level3_kvkv.dart';
import 'package:page_transition/page_transition.dart';
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
  void initState() {
    super.initState();
    // _play2();
    _play('assets/level3/Level 3 (pilihlah salah satu gambar).m4a');
  }

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  void _play(sound) {
    _player.open(
      Audio(sound),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  void dispose() {
    _player.dispose(); // Melepaskan sumber audio
    super.dispose();
  }

  // void _play2() {
  //   _player.open(
  //     Audio('assets/outro.mp3'),
  //     volume: 20,
  //     autoStart: true,
  //     showNotification: true,
  //     loopMode: LoopMode.single, // Loop the audio
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3ABEF9),
        title: const Text(
          'Level 3',
          style: TextStyle(color: Colors.white), // Text warna putih
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _player.dispose();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const GamesScreen()), // Replace SpecificPage with your target page
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background7.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFFFFB22C),
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
                        _player.dispose();
                        String imageName = _getImageName(index);
                        assetName = _getText(index);
                        assetLocation =
                            "assets/level3/aktivitas1/$imageName.png";
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
                          color: Colors.lightBlue,
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
                color: const Color(0xFFFFB22C),
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
                    // Check the boolean variables to determine if the item should be enabled
                    bool isEnabled = _checkIfEnabled(index);

                    return GestureDetector(
                      onTap: isEnabled
                          ? () {
                              _player.dispose();
                              String imageName = _getImageName2(index);
                              assetName = _getText2(index);
                              assetLocation =
                                  "assets/level3/aktivitas2/$imageName.png";
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
                            }
                          : null,
                      child: Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          color: isEnabled ? Colors.lightBlue : Colors.grey,
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
      ),
    );
  }
}

bool _checkIfEnabled(int index) {
  bool isEnabled = false;

  switch (index) {
    case 0:
      isEnabled = susu1 || sawi1 || sapu1 || siku1 || soda1;
      isEnabled = susu2 || sawi2 || sapu2 || siku2 || soda2;
      isEnabled = susu3 || sawi3 || sapu3 || siku3 || soda3;
      isEnabled = susu4 || sawi4 || sapu4 || siku4 || soda4;
      isEnabled = susu5 || sawi5 || sapu5 || siku5 || soda5;
      break;
    case 1:
      isEnabled = susu1 || sawi1 || sapu1 || siku1 || soda1;
      isEnabled = susu2 || sawi2 || sapu2 || siku2 || soda2;
      isEnabled = susu3 || sawi3 || sapu3 || siku3 || soda3;
      isEnabled = susu4 || sawi4 || sapu4 || siku4 || soda4;
      isEnabled = susu5 || sawi5 || sapu5 || siku5 || soda5;
      break;
    case 2:
      isEnabled = susu1 || sawi1 || sapu1 || siku1 || soda1;
      isEnabled = susu2 || sawi2 || sapu2 || siku2 || soda2;
      isEnabled = susu3 || sawi3 || sapu3 || siku3 || soda3;
      isEnabled = susu4 || sawi4 || sapu4 || siku4 || soda4;
      isEnabled = susu5 || sawi5 || sapu5 || siku5 || soda5;
      break;
    case 3:
      isEnabled = susu1 || sawi1 || sapu1 || siku1 || soda1;
      isEnabled = susu2 || sawi2 || sapu2 || siku2 || soda2;
      isEnabled = susu3 || sawi3 || sapu3 || siku3 || soda3;
      isEnabled = susu4 || sawi4 || sapu4 || siku4 || soda4;
      isEnabled = susu5 || sawi5 || sapu5 || siku5 || soda5;
      break;
    case 4:
      isEnabled = susu1 || sawi1 || sapu1 || siku1 || soda1;
      isEnabled = susu2 || sawi2 || sapu2 || siku2 || soda2;
      isEnabled = susu3 || sawi3 || sapu3 || siku3 || soda3;
      isEnabled = susu4 || sawi4 || sapu4 || siku4 || soda4;
      isEnabled = susu5 || sawi5 || sapu5 || siku5 || soda5;
      break;
    default:
      isEnabled = false;
  }

  // Print pesan jika semua kondisi true
  if (isEnabled && index >= 0 && index <= 4) {
    print('Enable = true for index $index');
  }

  return isEnabled;
}
