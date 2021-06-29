import 'package:flutter/material.dart';

// Variable routesMap mengarah ke file routes.dart pada folder configs
import 'package:latihan_api/configs/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Routes mengarah pada:
      // - lib/configs/routes.dart
      //
      // Tips: Anda dapat melakukan klik kanan,
      //       pada routesMap lalu pilih Go to Definition (F12).
      //
      //       Selalu lakukan ini untuk melakukan penelusuran
      //       alur coding lebih cepat.
      routes: routesMap,
    );
  }
}
