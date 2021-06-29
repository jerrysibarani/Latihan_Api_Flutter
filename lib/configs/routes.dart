import 'package:flutter/material.dart';

// Harap diperhatikan url pada import bergantung pada folder
// dan nama yang anda buat masing-masing.
import 'package:latihan_api/ui/DefaultPage.dart';
import 'package:latihan_api/ui/Dictionary/DictionaryIndexPage.dart';
import 'package:latihan_api/ui/Login/LoginIndexPage.dart';
import 'package:latihan_api/ui/Home/HomeIndexPage.dart';

// Anda dapat menelusuri alur coding dengan
// melakukan klik kanan Go to Definition (F12) pada:
// - LoginIndexPage()
// - HomeIndexPage()
// - DefaultPage()
final routesMap = {
  '/': (BuildContext context) => new DefaultPage(),
  '/Login': (BuildContext context) => new LoginIndexPage(),
  '/Home': (BuildContext context) => new HomeIndexPage(),
  '/Dictionary': (BuildContext context) => new DictionaryIndexPage(),
};
