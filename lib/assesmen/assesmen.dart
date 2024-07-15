import 'package:flutter/material.dart';
import 'package:genmmas/assesmen/assesmen_matching.dart';
import 'package:page_transition/page_transition.dart';

import '../games/kata_berawalan_screen.dart';

import '../services/globals.dart';
import 'assesmen_susun_kata.dart';

class assesmen extends StatefulWidget {
  const assesmen({Key? key}) : super(key: key);

  @override
  _assesmenState createState() => _assesmenState();
}

class _assesmenState extends State<assesmen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'assesmen',
          style: TextStyle(color: Colors.white), // Text warna putih
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Icon (panah kembali) warna putih
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      targetImage = 'assets/asesmen/1.png';
                      options = [
                        {
                          'image': 'tupai',
                          'path': 'assets/asesmen/2.png',
                        },
                        {
                          'image': 'topi',
                          'path': 'assets/asesmen/1.png',
                        },
                        {
                          'image': 'kursi',
                          'path': 'assets/asesmen/3.png',
                        },
                      ];
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const MatchingGameScreenAssestment(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
                    },
                    child: Container(
                      width: 80, // Lebar tombol
                      height: 80, // Tinggi tombol
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
                          size: 40, // Ukuran ikon bintang
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      targetImage = 'assets/asesmen/1.png';
                      options = [
                        {
                          'image': 'tupai',
                          'path': 'assets/asesmen/2.png',
                        },
                        {
                          'image': 'topi',
                          'path': 'assets/asesmen/1.png',
                        },
                        {
                          'image': 'kursi',
                          'path': 'assets/asesmen/3.png',
                        },
                      ];
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const MatchingGameScreenAssestment(),
                        ),
                      );
                      // Aksi yang ingin dilakukan ketika tombol ditekan
                    },
                    child: Container(
                      width: 80, // Lebar tombol
                      height: 80, // Tinggi tombol
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Membuat tombol berbentuk lingkaran
                        color: const Color.fromARGB(
                            255, 19, 212, 42), // Warna tombol
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color:
                              Colors.white, // Warna ikon bintang selalu putih
                          size: 40, // Ukuran ikon bintang
                        ),
                      ),
                    ),
                  ),
                ],
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
 // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const SizedBox(
              //       width: 50,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         assetName = 'susu';
              //         targetImage = 'assets/level4/susu.png';
              //         options4 = ["su", "mo", "sa", "su"];
              //         answer = [
              //           "",
              //           "",
              //         ];
              //         correctAnswer = ["su", "su"];
              //         Navigator.push(
              //           context,
              //           PageTransition(
              //             duration: const Duration(milliseconds: 300),
              //             type: PageTransitionType.rightToLeft,
              //             child: const SusunKataScreenAsesmen(),
              //           ),
              //         );
              //         // Aksi yang ingin dilakukan ketika tombol ditekan
              //       },
              //       child: Container(
              //         width: 80, // Lebar tombol
              //         height: 80, // Tinggi tombol
              //         decoration: BoxDecoration(
              //           shape: BoxShape
              //               .circle, // Membuat tombol berbentuk lingkaran
              //           color: const Color.fromARGB(
              //               255, 19, 212, 42), // Warna tombol
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.3),
              //               spreadRadius: 1,
              //               blurRadius: 2,
              //               offset: const Offset(
              //                   0, 2), // changes position of shadow
              //             ),
              //           ],
              //         ),
              //         child: const Center(
              //           child: Icon(
              //             Icons.star,
              //             color:
              //                 Colors.white, // Warna ikon bintang selalu putih
              //             size: 40, // Ukuran ikon bintang
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),