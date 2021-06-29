import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  DefaultPageState createState() => DefaultPageState();
}

class DefaultPageState extends State<DefaultPage> {
  // Widget build
  @override
  Widget build(BuildContext context) {
    // Perintah di dalam Future microtask
    // akan dieksekusi setelah scaffold selesai dibuat
    Future.microtask(() {
      // Perintah utk melakukan redirection ke halaman login,
      // anda dapat melakukan improvisasi di sini
      // dengan menambahkan kondisi if dimana redirect
      // ke halaman login atau halaman home
      Navigator.of(context).pushNamed("/Login");
    });

    // Return scaffold kosong dikarenakan page ini
    // hanya digunakan sebagai redirection
    return Scaffold();
  }
}
