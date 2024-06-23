import 'package:flutter/material.dart';

class SingleImageMatchingGameScreen extends StatefulWidget {
  const SingleImageMatchingGameScreen({Key? key}) : super(key: key);

  @override
  _SingleImageMatchingGameScreenState createState() =>
      _SingleImageMatchingGameScreenState();
}

class _SingleImageMatchingGameScreenState
    extends State<SingleImageMatchingGameScreen> {
  final String targetImage = 'assets/soal1/burung.png'; // Gambar samar-samar
  final List<Map<String, String>> options = [
    {'image': 'assets/soal1/ular.png', 'text': 'Ular'},
    {'image': 'assets/soal1/tupai.png', 'text': 'Tupai'},
    {'image': 'assets/soal1/kelinci.png', 'text': 'Kelinci'},
    {'image': 'assets/soal1/burung.png', 'text': 'Burung'},
  ]; // Pilihan gambar untuk dipasangkan

  String? selectedOption;
  bool matched = false;

  void _checkCompletion() {
    if (matched) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Selamat!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Kamu berhasil mencocokkan gambar!',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  matched = false;
                  selectedOption = null;
                });
              },
            ),
          ],
        );
      },
    );
  }

  bool _checkIfMatched(String option) {
    return option ==
        'assets/soal1/burung.png'; // Ganti dengan path gambar target yang sebenarnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text(
          'Pasangkan Gambar!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Klik gambar di bawah untuk memasangkan dengan gambar di atas',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Opacity(
                opacity: matched ? 1.0 : 0.5,
                child: Image.asset(
                  matched ? 'assets/soal1/burung.png' : targetImage,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option['image'];
                      });
                      if (_checkIfMatched(option['image']!)) {
                        setState(() {
                          matched = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cocok!')),
                        );
                        _showSuccessDialog();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Tidak cocok, coba lagi!')),
                        );
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedOption == option['image']
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            option['image']!,
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            option['text']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
