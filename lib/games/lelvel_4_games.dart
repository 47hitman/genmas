import 'package:flutter/material.dart';

import '../services/globals.dart';

class SusunKataScreenLevel4 extends StatefulWidget {
  const SusunKataScreenLevel4({super.key});

  @override
  _SusunKataScreenLevel4State createState() => _SusunKataScreenLevel4State();
}

class _SusunKataScreenLevel4State extends State<SusunKataScreenLevel4> {
  void checkAnswer() {
    if (answer[0] == correctAnswer[0] && answer[1] == correctAnswer[1]) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Benar!"),
          content: const Text("Selamat, jawaban kamu benar!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Salah"),
          content: const Text("Coba lagi, ya!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void updateAnswer(String selectedOption) {
    setState(() {
      for (int i = 0; i < answer.length; i++) {
        if (answer[i] == "") {
          answer[i] = selectedOption;
          break;
        }
      }
      if (!answer.contains("")) {
        checkAnswer();
      }
    });
  }

  void playSound() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Susun Kata Level 4',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gambar
          IconButton(
            icon: const Icon(Icons.volume_up, size: 50, color: Colors.blue),
            onPressed: playSound,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                targetImage,
                width: 70,
                height: 70,
              ),
              const SizedBox(height: 20),
              // Kolom kosong untuk jawaban
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(answer.length, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        answer[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Pilihan suku kata
          Wrap(
            alignment: WrapAlignment.center,
            children: options4.map((option) {
              return GestureDetector(
                onTap: () {
                  updateAnswer(option);
                },
                child: Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
