import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:convert';

const imagekey = 'IMAGE_KEY';

class OnSharedPreferences {
  OnSharedPreferences._privateConstructor();

  static final OnSharedPreferences instance =
      OnSharedPreferences._privateConstructor();

  String _jwt = "";
  String _username = "";
  final String _employee = "";
  String _imageIn = "";
  final String _employeeCode = "";
  final String _position = "";
  final String _id = "";
  final String _assetMangement = "";

  String get getJwtVal {
    return _jwt;
  }

  String get getUsername {
    return _username;
  }

  String get getPicture1 {
    return _imageIn;
  }

  String get namaEmployee {
    return _employee;
  }

  String get getCode {
    return _employeeCode;
  }

  String get getId {
    return _id;
  }

  String get getPosition {
    return _position;
  }

  String get assetManagement {
    return _assetMangement;
  }

  void setJwtVal(String values) {
    _jwt = values;
  }

  void setUsername(String values) {
    _username = values;
  }

  void setImageIn(String values) {
    _imageIn = values;
  }

  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "";
  }

  Future<bool> containsKey(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.containsKey(key);
  }

  removeValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(key);
  }

  removeAll() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.clear();
  }

  static Future<bool> saveImageToPrefs(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(imagekey, value);
  }

  static Future<bool> emptyPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.clear();
  }

  static Future<String?> loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(imagekey);
  }

  // encodes bytes list as string
  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  // decode bytes from a string
  static imageFrom64BaseString(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }
}
