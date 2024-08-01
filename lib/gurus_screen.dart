import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  bool isLoading = false;
  String message = "";

  Future<void> downloadAssessmentScore() async {
    setState(() {
      isLoading = true;
      message = "Downloading...";
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token == null) {
      setState(() {
        isLoading = false;
        message = "No auth token found";
      });
      return;
    }

    Uri url = Uri.parse('https://gemmasapi.kapuyuaxdev.my.id/assessment/score');

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          setState(() {
            isLoading = false;
            message = "Storage permission not granted";
          });
          return;
        }
      }

      String filename = "Assessment Result.xlsx";
      if (response.headers.containsKey('content-disposition')) {
        final contentDisposition = response.headers['content-disposition'];
        final filenameRegex = RegExp(r'filename="(.+)"');
        final matches = filenameRegex.firstMatch(contentDisposition!);
        if (matches != null && matches.groupCount == 1) {
          filename = matches.group(1)!;
        }
      }

      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/$filename';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        isLoading = false;
        message = "File saved to $filePath";
      });
    } else {
      setState(() {
        print(response.body);
        isLoading = false;
        message = "Failed to download file: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Assessment Score"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.file_download,
                      size: 100,
                      color: Colors.teal,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: downloadAssessmentScore,
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Download File",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
