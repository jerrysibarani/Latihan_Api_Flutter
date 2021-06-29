import 'package:flutter/material.dart';
import 'package:latihan_api/ui/fragment/MenuFragment.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar API'),
      ),
      drawer: MenuFragment(),
      body: Center(
        child: Text('Mengenal API'),
      ),
    );
  }
}
