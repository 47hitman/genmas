import 'package:flutter/material.dart';
import '../models/image_item.dart';

class TebakGambarScreen extends StatefulWidget {
  const TebakGambarScreen({super.key});

  @override
  _TebakGambarScreenState createState() => _TebakGambarScreenState();
}

class _TebakGambarScreenState extends State<TebakGambarScreen> {
  final List<ImageItem> _imageItems = [
    ImageItem(imagePath: 'assets/icon2.png', answer: 'Kucing'),
    ImageItem(imagePath: 'assets/icon2.png', answer: 'Anjing'),
    ImageItem(imagePath: 'assets/icon2.png', answer: 'Burung'),
    // Tambahkan semua item gambar yang diperlukan
  ];

  int _currentIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _checkAnswer() {
    if (_controller.text.toLowerCase() ==
        _imageItems[_currentIndex].answer.toLowerCase()) {
      setState(() {
        _feedback = 'Benar!';
        if (_currentIndex < _imageItems.length - 1) {
          _currentIndex++;
        } else {
          _feedback = 'Selamat! Anda telah menyelesaikan semua gambar!';
        }
      });
    } else {
      setState(() {
        _feedback = 'Salah, coba lagi!';
      });
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tebak Gambar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_imageItems[_currentIndex].imagePath),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Jawaban'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Cek Jawaban'),
            ),
            const SizedBox(height: 16.0),
            Text(_feedback),
          ],
        ),
      ),
    );
  }
}
