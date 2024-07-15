import 'package:flutter/material.dart';
import 'package:genmmas/assesmen/assesmen_matching.dart';
import 'package:page_transition/page_transition.dart';

import '../services/globals.dart';
import '../services/services.dart';
import 'assesmen_katapola.dart';
import 'assesmen_susun_kata.dart';
import 'assesmen_voice.dart';

List<Map<String, dynamic>> resources = [];
List<Map<String, dynamic>> resources2 = [];

class assesmen extends StatefulWidget {
  const assesmen({Key? key}) : super(key: key);

  @override
  _assesmenState createState() => _assesmenState();
}

class _assesmenState extends State<assesmen> {
  // String targetImage = '';
  // List<Map<String, String>> options = [];
  @override
  void initState() {
    super.initState();
    _doSomething();
    _doSomething2();
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevents dialog from being dismissed by the back button
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _doSomething() async {
    try {
      dynamic value = await Services.instance.soal();
      setState(() {
        if (value is Map<String, dynamic>) {
          // Handle map data
        } else if (value is List<dynamic>) {
          // print('Received a List:');
          // print(value);
          // Cast the dynamic list to a List<Map<String, dynamic>>
          resources = List<Map<String, dynamic>>.from(value);
        } else {
          // Handle unknown data type
        }
      });
    } catch (e) {
      _showErrorDialog(
          'Error', 'An error occurred while fetching user information.');
    }
  }

  void _doSomething2() async {
    try {
      dynamic value = await Services.instance.soal2();
      setState(() {
        if (value is Map<String, dynamic>) {
          // Handle map data
        } else if (value is List<dynamic>) {
          // print('Received a List:');
          // print(value);
          // Cast the dynamic list to a List<Map<String, dynamic>>
          resources2 = List<Map<String, dynamic>>.from(value);
        } else {
          // Handle unknown data type
        }
      });
    } catch (e) {
      _showErrorDialog(
          'Error', 'An error occurred while fetching user information.');
    }
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Level 1",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  final targetImagesoal = resource['resource']['targetImage'];
                  final optionsList = resource['resource']['option'];
                  final sound = resource['resource']['levelSound'];
                  // Ensure the optionsList is a List<Map<String, String>>
                  final optionssoal = List<Map<String, String>>.from(
                    optionsList.map((item) => Map<String, String>.from(item)),
                  );

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        options = optionssoal;
                        targetImage = targetImagesoal;
                        soundAsesmen = sound;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const MatchingGameScreenAssestment(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 19, 212, 42),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Soal ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 19, 212, 42),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Level 2",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources2.length,
                itemBuilder: (context, index) {
                  final resource2 = resources2[index];
                  final sound2 = resource2['resource']['levelSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        // Pastikan struktur data sesuai dengan yang diharapkan
                        if (resource2.containsKey('resource') &&
                            resource2['resource'] is Map<String, dynamic>) {
                          var resource = resource2['resource'];

                          // Pastikan option ada dan merupakan List<Map<String, dynamic>>
                          if (resource.containsKey('option') &&
                              resource['option'] is List<dynamic>) {
                            // Coba melakukan pengecoran ke List<Map<String, dynamic>>
                            List<Map<String, dynamic>> optionList =
                                List<Map<String, dynamic>>.from(
                                    resource['option']);

                            // Pastikan optionList sesuai dengan yang diharapkan
                            if (optionList.isNotEmpty) {
                              // Mengambil daftar teks dari option
                              List<String> finalOptionsList = optionList
                                  .map((option) => option['text'] as String)
                                  .toList();

                              // Cetak hasilnya
                              // print(finalOptionsList);
                              kvkv = finalOptionsList[0];
                              option2 = finalOptionsList[1];
                              option3 = finalOptionsList[3];
                            } else {
                              // print('Error: Option list is empty.');
                            }
                          } else {
                            // print(
                            //     'Error: Option list is not in the expected format.');
                          }
                        } else {
                          // print(
                          //     'Error: Resource structure is not in the expected format.');
                        }
                        sound = sound2;
                        appbar = "KVKV";
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const KataPolaAsesment(),
                          ),
                        );
                        // print(finalOptionsList);
                        // options = optionssoal;
                        // targetImage = targetImagesoal;
                        // soundAsesmen = sound;
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     duration: const Duration(milliseconds: 300),
                        //     type: PageTransitionType.rightToLeft,
                        //     child: const MatchingGameScreenAssestment(),
                        //   ),
                        // );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 19, 212, 42),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Soal ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Expanded(
            //   child: ListView.builder(
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 10,
            //       horizontal: 20,
            //     ),
            //     itemCount: otherResources
            //         .length, // Ganti dengan jumlah item dari list kedua
            //     itemBuilder: (context, index) {
            //       final resource = otherResources[
            //           index]; // Ganti dengan sumber data dari list kedua

            //       // Buat widget item untuk list kedua sesuai dengan kebutuhan Anda
            //       return ListTile(
            //         title: Text('Item ${index + 1}'),
            //         // Tambahkan logic atau tampilan sesuai kebutuhan
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 19, 212, 42),
//         title: const Text(
//           'assesmen',
//           style: TextStyle(color: Colors.white), // Text warna putih
//         ),
//         iconTheme: const IconThemeData(
//           color: Colors.white, // Icon (panah kembali) warna putih
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/background7.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 19, 212, 42),
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Level 1",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
  // targetImage = 'assets/asesmen/1.png';
  // options = [
  //   {
  //     'image': 'tupai',
  //     'path': 'assets/asesmen/2.png',
  //   },
  //   {
  //     'image': 'topi',
  //     'path': 'assets/asesmen/1.png',
  //   },
  //   {
  //     'image': 'kursi',
  //     'path': 'assets/asesmen/3.png',
  //   },
  // ];
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           duration: const Duration(milliseconds: 300),
//                           type: PageTransitionType.rightToLeft,
//                           child: const MatchingGameScreenAssestment(),
//                         ),
//                       );
//                       // Aksi yang ingin dilakukan ketika tombol ditekan
//                     },
//                     child: Container(
//                       width: 80, // Lebar tombol
//                       height: 80, // Tinggi tombol
//                       decoration: BoxDecoration(
//                         shape: BoxShape
//                             .circle, // Membuat tombol berbentuk lingkaran
//                         color: const Color.fromARGB(
//                             255, 19, 212, 42), // Warna tombol
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(
//                                 0, 2), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.star,
//                           color:
//                               Colors.white, // Warna ikon bintang selalu putih
//                           size: 40, // Ukuran ikon bintang
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 50,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 19, 212, 42),
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Level 2",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     width: 50,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       sound =
//                           'assets/level2/Level 2 (aktivitas 2a ini dibaca susu).m4a';
//                       appbar = "KVKV";
//                       kvkv = "susu";
//                       option2 = "air";
//                       option3 = "roti";
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           duration: const Duration(milliseconds: 300),
//                           type: PageTransitionType.rightToLeft,
//                           child: const KataPolaAsesment(),
//                         ),
//                       );
//                       // Aksi yang ingin dilakukan ketika tombol ditekan
//                     },
//                     child: Container(
//                       width: 80, // Lebar tombol
//                       height: 80, // Tinggi tombol
//                       decoration: BoxDecoration(
//                         shape: BoxShape
//                             .circle, // Membuat tombol berbentuk lingkaran
//                         color: const Color.fromARGB(
//                             255, 19, 212, 42), // Warna tombol
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(
//                                 0, 2), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.star,
//                           color:
//                               Colors.white, // Warna ikon bintang selalu putih
//                           size: 40, // Ukuran ikon bintang
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 19, 212, 42),
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Level 3",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       assetName = 'susu';
//                       targetImage = 'assets/level4/susu.png';
//                       options4 = ["u", "s", "s", "u"];
//                       answer = ["", "", "", ""];
//                       correctAnswer = ["s", "u", "s" "u"];
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           duration: const Duration(milliseconds: 300),
//                           type: PageTransitionType.rightToLeft,
//                           child: const SusunKataScreenAsesmen(),
//                         ),
//                       );
//                       // Aksi yang ingin dilakukan ketika tombol ditekan
//                     },
//                     child: Container(
//                       width: 80, // Lebar tombol
//                       height: 80, // Tinggi tombol
//                       decoration: BoxDecoration(
//                         shape: BoxShape
//                             .circle, // Membuat tombol berbentuk lingkaran
//                         color: const Color.fromARGB(
//                             255, 19, 212, 42), // Warna tombol
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(
//                                 0, 2), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.star,
//                           color:
//                               Colors.white, // Warna ikon bintang selalu putih
//                           size: 40, // Ukuran ikon bintang
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 50,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 19, 212, 42),
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Level 4",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     width: 50,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       voice = "susu";
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           duration: const Duration(milliseconds: 300),
//                           type: PageTransitionType.rightToLeft,
//                           child: const VoiceGameAssesmentScreen(),
//                         ),
//                       );
//                       // Aksi yang ingin dilakukan ketika tombol ditekan
//                     },
//                     child: Container(
//                       width: 80, // Lebar tombol
//                       height: 80, // Tinggi tombol
//                       decoration: BoxDecoration(
//                         shape: BoxShape
//                             .circle, // Membuat tombol berbentuk lingkaran
//                         color: const Color.fromARGB(
//                             255, 19, 212, 42), // Warna tombol
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(
//                                 0, 2), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.star,
//                           color:
//                               Colors.white, // Warna ikon bintang selalu putih
//                           size: 40, // Ukuran ikon bintang
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
