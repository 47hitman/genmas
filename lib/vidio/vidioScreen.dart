// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewPage extends StatefulWidget {
//   const WebViewPage({Key? key}) : super(key: key);

//   @override
//   WebViewPageState createState() => WebViewPageState();
// }

// class WebViewPageState extends State<WebViewPage> {
//   bool isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutorial Siswa',
//       home: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: FlexibleSpaceBar(
//             background: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 186, 212, 19),
//                     Color.fromARGB(255, 172, 113, 37),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () => Navigator.of(context).pop(),
//               icon: const Icon(Icons.arrow_back)),
//           title: const Text("Tutorial Siswa"),
//         ),
//         body: Stack(
//           children: <Widget>[
//             WebView(
//               initialUrl: "https://www.youtube.com/embed/Zqx3luVm9YQ",
//               javascriptMode: JavascriptMode.unrestricted,
//               onPageFinished: (finish) {
//                 setState(() {
//                   isLoading = false;
//                 });
//               },
//             ),
//             isLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  InstructionsScreen({super.key}); // Removed 'const' from the constructor

  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();

  void _playVoiceInstruction() {
    // Code to play voice instruction goes here
    _play();
  }

  void _play() {
    _player.open(
      Audio('assets/revisi/Petunjuk penggunaan enhanced.wav'),
      volume: 20,
      autoStart: true,
      showNotification: true,
      loopMode: LoopMode.single, // Loop the audio
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petunjuk Penggunaan'),
      ),
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Set height to full screen height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  size: 40,
                ),
                onPressed: _playVoiceInstruction,
              ),
              const Row(
                children: [
                  Text(
                    '1. Pada halaman utama  terdiri dari',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          8), // Add some spacing between the text and the image
                  // Icon(
                  //   Icons.home, // Use the home icon
                  //   color: Colors.green, // Set the color to green
                  //   size: 24, // Adjust the size as needed
                  // ),
                ],
              ),
              // const Text(
              //   '1. Pada halaman utama terdiri dari:',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 8),
              // const Icon(
              //   Icons.videogame_asset,
              //   size: 50,
              //   color: Colors.purple,
              // ),
              const Text(
                '• Permainan berisi permainan tentang membaca permulaan',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),

              // Image.asset(
              //   'assets/revisi/Icon asesmen.png',
              //   width: 40,
              //   height: 50,
              // ),
              const Text(
                '• Asesmen berisi aktivitas tentang membaca permulaan',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              const Row(
                children: [
                  Text(
                    '2. Pada profil terdiri dari:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          8), // Add some spacing between the text and the image
                  // Icon(
                  //   Icons.person,
                  //   size: 20,
                  //   color: Colors.purple,
                  // ),
                ],
              ),

              const SizedBox(height: 8),
              // Image.asset(
              //   'assets/revisi/Icon edit profil.png',
              //   width: 40,
              //   height: 50,
              // ),
              const Text(
                '• Edit profil untuk memasukkan identitas diri',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              // Image.asset(
              //   'assets/revisi/Icon tentang aplikasi.png',
              //   width: 40,
              //   height: 50,
              // ),
              const Text(
                '• Tentang aplikasi untuk menginformasikan kepada pengguna aplikasi',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              // Image.asset(
              //   'assets/revisi/Icon keluar.png',
              //   width: 40,
              //   height: 50,
              // ),
              const Text(
                '• Keluar untuk mengakhiri aplikasi',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Silahkan pilih bagian yang diinginkan pada halaman utama',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              // Image.asset(
              //   'assets/revisi/Icon edit profil.png',
              //   width: 40,
              //   height: 50,
              // ),
              const Text(
                '4. Sebelum mulai menggunakan game ini, silahkan pilih edit profil.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              const Text(
                '5. Untuk kembali ke halaman sebelumnya klik tombol kembali ',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
