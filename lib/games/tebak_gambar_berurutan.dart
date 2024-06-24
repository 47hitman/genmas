import 'package:flutter/material.dart';

import '../services/globals.dart';

class TebakGambarBerurutanScreen extends StatefulWidget {
  const TebakGambarBerurutanScreen({super.key});

  @override
  _TebakGambarBerurutanScreenState createState() =>
      _TebakGambarBerurutanScreenState();
}

class _TebakGambarBerurutanScreenState
    extends State<TebakGambarBerurutanScreen> {
  int currentIndex = 0;

  void _checkAnswer(String selectedImage) {
    setState(() {
      if (selectedImage == images[(currentIndex + 3) % images.length]) {
        _showDialog(true); // Menampilkan dialog jika jawaban benar
        currentIndex = (currentIndex + 1) % images.length;
      } else {
        _showDialog(false); // Menampilkan dialog jika jawaban salah
        // Show some feedback for incorrect answer
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Salah! Coba lagi.')),
        );
      }
    });
  }

  // Method untuk menampilkan dialog berdasarkan status jawaban
  void _showDialog(bool correct) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(correct ? 'Jawaban Benar!' : 'Jawaban Salah!'),
          content: Text(correct
              ? 'Selamat! Anda menjawab dengan benar.'
              : 'Maaf, jawaban Anda salah. Silakan coba lagi.'),
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
        title: const Text('Ayo Tebak Gambar Berikutnya'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the current images in sequence
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[(currentIndex) % images.length],
                height: 100,
                width: 100,
              ),
              Image.asset(
                images[(currentIndex + 1) % images.length],
                height: 100,
                width: 100,
              ),
              Image.asset(
                images[(currentIndex + 2) % images.length],
                height: 100,
                width: 100,
              ),
              const Text(
                "....",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Tebak gambar berikutnya:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Display the options
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () =>
                    _checkAnswer(images[(currentIndex + 3) % images.length]),
                child: Image.asset(
                  images[(currentIndex + 3) % images.length],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () =>
                    _checkAnswer(images[(currentIndex + 4) % images.length]),
                child: Image.asset(
                  images[(currentIndex + 4) % images.length],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
