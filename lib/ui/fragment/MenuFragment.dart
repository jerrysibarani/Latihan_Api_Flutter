import 'package:flutter/material.dart';

class MenuFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('jerrysibarani@gmail.com'),
            accountName: Text('Jerry Sibarani'),
            currentAccountPicture: CircleAvatar(
                child: new Icon(
              Icons.person,
              size: 50,
            )),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {
              // Navigator.of(context).popAndPushNamed("/home");
              Navigator.of(context).pushNamed("/Home");
            },
          ),
          ListTile(
            title: Text("Dictionary"),
            leading: Icon(Icons.book),
            onTap: () {
              // Navigator.of(context).popAndPushNamed("/Dictionary");
              Navigator.of(context).pushNamed("/Dictionary");
            },
          ),
        ],
      ),
    );
  }
}
