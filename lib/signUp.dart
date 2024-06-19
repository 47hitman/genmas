// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:genmmas/loginScreens.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'services/services.dart';

// import '../otp/otp-screen.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'login_screen';

  const RegisterScreen({super.key});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasscontroller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var count = 0;
  // ignore: unused_field
  final bool _buttonEnabled = false;
  bool isPasswordVisible = true;
  // ignore: unused_field

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  bool _areAllControllersEmpty() {
    return emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        confirmPasscontroller.text.isEmpty &&
        usernameController.text.isEmpty &&
        firstNameController.text.isEmpty &&
        lastNamecontroller.text.isEmpty &&
        dateOfBirthController.text.isEmpty;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _doSomething() async {
    if (_areAllControllersEmpty()) {
      _showErrorDialog('Mohon Isi Semua Data');
      _btnController.reset();
    } else {
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));
      _btnController.reset();
      try {
        String? value = await Services.instance.registerApp(
          usernameController.text,
          passwordController.text,
          emailController.text,
          firstNameController.text,
          lastNamecontroller.text,
        );
        if (value != null) {
          _btnController.stop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
            ),
          );
        } else {
          _btnController.stop();
          _showErrorDialog('Daftar Gagal');
        }
      } catch (e) {
        print(e);
        _btnController.stop();
        _showErrorDialog('Daftar Gagal');
      }
    }
    // Further actions can be taken here after the form is validated and the network request is successful.

    // Timer(Duration(seconds: 1), () {
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  // ignore: unused_element
  void _dialogToLogin() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.only(
            top: 20.0,
          ),
          content: Container(
              child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: SvgPicture.asset(
              //     'assets/icons/iconprofile/success.svg',
              //   ),
              // ),
              SizedBox(height: 15),
              Text(
                "Registrasi Berhasil",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Cek kode OTP yang kami kirim ke nomor anda",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ],
          )),
          actions: const <Widget>[
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 20, top: 15),
            //     child: MaterialButton(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8)),
            //       minWidth: 150,
            //       color: const Color(0xFFFF9900),
            //       child: const Text(
            //         "Oke",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       onPressed: () {
            //         Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //                 // ignore: missing_required_param
            //                 builder: (BuildContext context) => OtpScreen()));
            //       },
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }

  void _showDialogTimeout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.only(
            top: 20.0,
          ),
          content: Container(
              child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: SvgPicture.asset(
              //     'assets/icons/iconprofile/failed.svg',
              //   ),
              // ),
              SizedBox(height: 15),
              Text(
                "Registrasi gagal",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Periksa kembali jaringan internet Anda",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ],
          )),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minWidth: 150,
                  color: const Color(0xFFFF9900),
                  child: const Text(
                    "Oke",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void failedRegisterDialog(text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.only(
            top: 20.0,
          ),
          content: Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: SvgPicture.asset(
              //     'assets/icons/iconprofile/failed.svg',
              //   ),
              // ),
              const SizedBox(height: 15),
              const Text(
                "Registrasi gagal",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ],
          )),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minWidth: 150,
                  color: const Color(0xFFFF9900),
                  child: const Text(
                    "Oke",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/icons/appicon.png'),
      ),
    );

    // ignore: unused_local_variable
    final Shader lineargradient = const LinearGradient(colors: <Color>[
      Color(0xFF1254A0),
      Color(0xFF15bae8),
    ]).createShader(const Rect.fromLTWH(0, 0, 200, 70));

    final name = TextFormField(
      validator: (value) => value!.isEmpty
          ? 'Mohon diisi terlebih dahulu'
          : value.contains(" ")
              ? 'Username tidak boleh menggunakan spasi/karakter'
              : null,
      autofocus: false,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_. ]'))
      ],
      controller: usernameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Nama',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Mohon diisi dengan alamat email yang valid';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: InputBorder.none,
      ),
    );

    final fname = TextFormField(
      validator: (value) =>
          value!.isEmpty ? 'Mohon diisi terlebih dahulu' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      controller: firstNameController,
      decoration: const InputDecoration(
        labelText: 'Nama Depan',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
      ),
    );

    final lname = TextFormField(
      validator: (value) =>
          value!.isEmpty ? 'Mohon diisi terlebih dahulu' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      controller: lastNamecontroller,
      decoration: const InputDecoration(
        labelText: 'Nama Belakang',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPasswordVisible,
      validator: (value) => value!.length < 8 ? 'Minimal 8 karakter' : null,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible)),
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
      ),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      controller: confirmPasscontroller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPasswordVisible,
      validator: (value) =>
          confirmPasscontroller.text != passwordController.text
              ? 'Password tidak cocok'
              : null,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible)),
        labelText: 'Konfirmasi Password',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
      ),
    );

    // final phoneNumber = TextFormField(
    //   autofocus: false,
    //   keyboardType: const TextInputType.numberWithOptions(signed: true),
    //   inputFormatters: [
    //     FilteringTextInputFormatter.digitsOnly,
    //   ],
    //   controller: phoneNumbController,
    //   autovalidateMode: AutovalidateMode.onUserInteraction,
    //   validator: (value) => value!.length < 6 || value.length > 13
    //       ? 'Mohon diisi dengan nomor yang aktif'
    //       : null,
    //   decoration: const InputDecoration(
    //     labelText: 'Nomor HP',
    //     prefixText: "+62",
    //     filled: true,
    //     fillColor: Colors.white,
    //     contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    //     border: InputBorder.none,
    //   ),
    // );

    final dateOfBirthField = TextFormField(
      autofocus: false,
      readOnly: true, // Make the field read-only to prevent manual editing
      controller: dateOfBirthController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tanggal lahir tidak boleh kosong';
        }

        // Check if the date format is valid (dd/MM/yyyy)
        final dateParts = value.split('/');
        if (dateParts.length != 3) {
          return 'Format tanggal salah (dd/MM/yyyy)';
        }
        final day = int.tryParse(dateParts[0]);
        final month = int.tryParse(dateParts[1]);
        final year = int.tryParse(dateParts[2]);

        if (day == null || month == null || year == null) {
          return 'Format tanggal salah (dd/MM/yyyy)';
        }
        if (day < 1 ||
            day > 31 ||
            month < 1 ||
            month > 12 ||
            year < 1900 ||
            year > DateTime.now().year) {
          return 'Tanggal tidak valid';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Tanggal Lahir',
        hintText: 'dd/MM/yyyy',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => selectDate(context, dateOfBirthController),
        ),
      ),
    );

    final registerButton = RoundedLoadingButton(
      color: const Color.fromARGB(255, 19, 212, 42),
      controller: _btnController,
      onPressed: _doSomething,
      child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 212, 42),
              borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text("Daftar", style: TextStyle(color: Colors.white)))),
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),

        // resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.78,
              child: Stack(alignment: Alignment.center, children: [
                Transform.translate(
                  offset: const Offset(0.0, 150.0),
                  child: Container(
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      // child: SvgPicture.asset(
                      //   'assets/icons/iconprofile/Pattern.svg',
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                ),
              ]),
            ),
            SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // top: 40,
                      // left: MediaQuery.of(context).size.width * 0.77,
                      // left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, right: 5),
                        child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              // decoration: new BoxDecoration(
                              //   color: Color(0xFF1088A9),
                              //   // border: Border.all(color: Colors.grey),
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              child: const Text(
                                'Kembali',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: const Image(
                        width: 250,
                        image: AssetImage(
                          "assets/icon2.png",
                        ),
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.66,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 25, 15),
                            child: Form(
                              key: formKey,
                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Daftar",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: name,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: email,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: fname,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: lname,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: password,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: confirmPassword,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: dateOfBirthField,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    registerButton,
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(
                                          //  style: DefaultTextStyle.of(context).style,
                                          children: <TextSpan>[
                                            const TextSpan(
                                              text: "Sudah mempunyai akun? ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            TextSpan(
                                                text: ' Sign In',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 19, 212, 42),
                                                    fontSize: 14),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const LoginScreen()),
                                                        );
                                                      }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
