// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:genmmas/assesmen/assesmen_matching.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../menuScreens.dart';
import '../services/globals.dart';
import '../services/services.dart';
import 'assesmen_katapola.dart';
import 'assesmen_susun_kata.dart';
import 'assesmen_voice.dart';

List<Map<String, dynamic>> resources = [];
List<Map<String, dynamic>> resources11 = [];
List<Map<String, dynamic>> resources2 = [];
List<Map<String, dynamic>> resources22 = [];
List<Map<String, dynamic>> resources3 = [];
List<Map<String, dynamic>> resources33 = [];
List<Map<String, dynamic>> resources4 = [];
List<Map<String, dynamic>> resources44 = [];
List<Map<String, dynamic>> resources5 = [];
List<Map<String, dynamic>> resources55 = [];
final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

class assesmen extends StatefulWidget {
  const assesmen({Key? key}) : super(key: key);

  @override
  _assesmenState createState() => _assesmenState();
}

class _assesmenState extends State<assesmen> {
  @override
  void initState() {
    super.initState();
    _fetchData(Services.instance.soal, (data) => resources = data);
    _fetchData(Services.instance.soal11, (data) => resources11 = data);
    _fetchData(Services.instance.soal2, (data) => resources2 = data);
    _fetchData(Services.instance.soal22, (data) => resources22 = data);
    _fetchData(Services.instance.soal3, (data) => resources3 = data);
    _fetchData(Services.instance.soal33, (data) => resources33 = data);
    _fetchData(Services.instance.soal4, (data) => resources4 = data);
    _fetchData(Services.instance.soal44, (data) => resources44 = data);
    _fetchData(Services.instance.soal5, (data) => resources5 = data);
    _fetchData(Services.instance.soal55, (data) => resources55 = data);
  }

  void _fetchData(Future<dynamic> Function() serviceCall,
      Function(List<Map<String, dynamic>>) onSuccess) async {
    try {
      dynamic value = await serviceCall();
      setState(() {
        if (value is List<dynamic>) {
          onSuccess(List<Map<String, dynamic>>.from(value));
        } else {
          // Handle unknown data type
        }
      });
    } catch (e) {
      _showErrorDialog('Error', 'An error occurred while fetching data.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
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

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah kamu yakin menyelesaikan ujian?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Tidak',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              onPressed: () {
                _btnController.stop();
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Iya',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MenuScreen()), // Replace SpecificPage with your target page
                );
                // Add your completion logic here
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = RoundedLoadingButton(
      color: const Color.fromARGB(255, 19, 212, 42),
      controller: _btnController,
      onPressed: () {
        _showConfirmationDialog();
      },
      child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 212, 42),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
              child: Text("Selesai",
                  style: TextStyle(color: Colors.white, fontSize: 26)))),
    );
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 223, 186), // Light orange background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 1",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans', // Playful font
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                          color: const Color.fromARGB(
                              255, 255, 165, 0), // Bright orange
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 255, 223, 186),
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 1 Letter Discrimination",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources11.length,
                itemBuilder: (context, index) {
                  final resource = resources11[index];
                  final targetImagesoal = resource['resource']['targetImage'];
                  final optionsList = resource['resource']['option'];
                  final sound = resource['resource']['levelSound'];
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
                          color: const Color.fromARGB(255, 255, 165, 0),
                          borderRadius: BorderRadius.circular(20),
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 223, 186), // Light orange background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 2 KVKV",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans', // Playful font
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                        if (resource2.containsKey('resource') &&
                            resource2['resource'] is Map<String, dynamic>) {
                          var resource = resource2['resource'];
                          if (resource.containsKey('option') &&
                              resource['option'] is List<dynamic>) {
                            List<Map<String, dynamic>> optionList =
                                List<Map<String, dynamic>>.from(
                                    resource['option']);
                            if (optionList.isNotEmpty) {
                              List<String> finalOptionsList = optionList
                                  .map((option) => option['text'] as String)
                                  .toList();
                              kvkv = finalOptionsList[0];
                              option2 = finalOptionsList[1];
                              option3 = finalOptionsList[2];
                              option4 = finalOptionsList[3];
                            }
                          }
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
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 135, 206, 235), // Sky blue color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 182, 193), // Light pink background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 2 KVKVK",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources22.length,
                itemBuilder: (context, index) {
                  final resource2 = resources22[index];
                  final sound2 = resource2['resource']['levelSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        if (resource2.containsKey('resource') &&
                            resource2['resource'] is Map<String, dynamic>) {
                          var resource = resource2['resource'];
                          if (resource.containsKey('option') &&
                              resource['option'] is List<dynamic>) {
                            List<Map<String, dynamic>> optionList =
                                List<Map<String, dynamic>>.from(
                                    resource['option']);
                            if (optionList.isNotEmpty) {
                              List<String> finalOptionsList = optionList
                                  .map((option) => option['text'] as String)
                                  .toList();
                              kvkv = finalOptionsList[0];
                              option2 = finalOptionsList[1];
                              option3 = finalOptionsList[2];
                              option4 = finalOptionsList[3];
                            }
                          }
                        }
                        sound = sound2;
                        appbar = "KVKVK";
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const KataPolaAsesment(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 144, 238, 144), // Light green color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 223, 186), // Light orange background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 3 KVKV",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans', // Playful font
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources3.length,
                itemBuilder: (context, index) {
                  final resource3 = resources3[index];
                  final options = resource3['resource']['option'];
                  final correctAnswer2 = resource3['resource']['correctAnswer'];
                  final image = resource3['resource']['targetImage'];
                  final sound = resource3['resource']['levelSound'];
                  final asset = resource3['resource']['assetName'];
                  final soundlevel = resource3['resource']['assetSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        assetName = asset;
                        targetImage = image;
                        optionsAsesmen = options;
                        answer = ["", "", "", ""];
                        correctAnswerAsesmen = correctAnswer2;
                        soundAsesmen = sound;
                        levelSoundAsesmen = soundlevel;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const SusunKataScreenAsesmen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 135, 206, 235), // Sky blue color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 182, 193), // Light pink background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 3 KVKVK",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources33.length,
                itemBuilder: (context, index) {
                  final resource3 = resources33[index];
                  final options = resource3['resource']['option'];
                  final correctAnswer2 = resource3['resource']['correctAnswer'];
                  final image = resource3['resource']['targetImage'];
                  final sound = resource3['resource']['levelSound'];
                  final asset = resource3['resource']['assetName'];
                  final soundlevel = resource3['resource']['assetSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        assetName = asset;
                        targetImage = image;
                        optionsAsesmen = options;
                        answer = ["", "", "", "", ""];
                        correctAnswerAsesmen = correctAnswer2;
                        soundAsesmen = sound;
                        levelSoundAsesmen = soundlevel;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const SusunKataScreenAsesmen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 144, 238, 144), // Light green color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 223, 186), // Light orange background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 4 KVKV",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans', // Playful font
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources4.length,
                itemBuilder: (context, index) {
                  final resource4 = resources4[index];
                  final options = resource4['resource']['option'];
                  final correctAnswer2 = resource4['resource']['correctAnswer'];
                  final image = resource4['resource']['targetImage'];
                  final sound = resource4['resource']['levelSound'];
                  final asset = resource4['resource']['assetName'];
                  final soundlevel = resource4['resource']['assetSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        assetName = asset;
                        targetImage = image;
                        optionsAsesmen = options;
                        answer = ["", ""];
                        correctAnswerAsesmen = correctAnswer2;
                        soundAsesmen = sound;
                        levelSoundAsesmen = soundlevel;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const SusunKataScreenAsesmen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 135, 206, 235), // Sky blue color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 182, 193), // Light pink background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 4 KVKVK",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources44.length,
                itemBuilder: (context, index) {
                  final resource4 = resources44[index];
                  final options = resource4['resource']['option'];
                  final correctAnswer2 = resource4['resource']['correctAnswer'];
                  final image = resource4['resource']['targetImage'];
                  final sound = resource4['resource']['levelSound'];
                  final asset = resource4['resource']['assetName'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        final soundlevel = resource4['resource']['assetSound'];
                        levelSoundAsesmen = soundlevel;
                        assetName = asset;
                        targetImage = image;
                        optionsAsesmen = options;
                        answer = ["", ""];
                        correctAnswerAsesmen = correctAnswer2;
                        soundAsesmen = sound;

                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const SusunKataScreenAsesmen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 144, 238, 144), // Light green color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 182, 193), // Light pink background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 5 KVKV",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans', // Playful font
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources5.length,
                itemBuilder: (context, index) {
                  final resource5 = resources5[index];
                  final correctAnswer2 = resource5['resource']['correctAnswer'];
                  final sound2 = resource5['resource']['levelSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        sound = sound2;
                        voice = correctAnswer2;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const VoiceGameAssesmentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 135, 206, 235), // Sky blue color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(
                    255, 255, 223, 186), // Light orange background
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "Level 5 KVKVK",
                  style: TextStyle(
                    color: Colors.brown, // Contrasting text color
                    fontSize: 24, // Larger font size
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                itemCount: resources55.length,
                itemBuilder: (context, index) {
                  final resource5 = resources55[index];
                  final correctAnswer2 = resource5['resource']['correctAnswer'];
                  final sound2 = resource5['resource']['levelSound'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        sound = sound2;
                        voice = correctAnswer2;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const VoiceGameAssesmentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 144, 238, 144), // Light green color
                          borderRadius:
                              BorderRadius.circular(20), // More rounded corners
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
                              fontSize: 24, // Reduced font size for balance
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        child: loginButton,
      ),
    );
  }
}
