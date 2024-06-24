import 'package:flutter/material.dart';
import 'package:genmmas/games/lengkapi_kata_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../services/globals.dart';

class Level3kvkv extends StatefulWidget {
  const Level3kvkv({Key? key}) : super(key: key);

  @override
  _Level3kvkvState createState() => _Level3kvkvState();
}

class _Level3kvkvState extends State<Level3kvkv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        title: const Text(
          'Menyusun Huruf Menjadi Kata ',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 200,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace with your asset or placeholder
                  Image.asset(
                    assetLocation, // Example asset path
                    width: 100,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    assetName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  pilih1 = false;
                  pilih2 = false;
                  pilih3 = false;
                  timer = false;
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const LengkapiKataScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 19, 212, 42), // Same color as AppBar
                ),
                child:
                    const Text('Soal 1', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  pilih1 = true;
                  pilih2 = true;
                  pilih3 = true;
                  timer = false;
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const LengkapiKataScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 19, 212, 42), // Same color as AppBar
                ),
                child:
                    const Text('Soal 2', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  pilih1 = true;
                  pilih2 = true;
                  pilih3 = true;
                  timer = true;
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const LengkapiKataScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 19, 212, 42), // Same color as AppBar
                ),
                child:
                    const Text('Soal 3', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
