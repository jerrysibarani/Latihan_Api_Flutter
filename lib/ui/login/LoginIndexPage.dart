import 'package:flutter/material.dart';

class LoginIndexPage extends StatefulWidget {
  // Memanggil EntryFormState dengan parameter
  @override
  LoginIndexPageState createState() => LoginIndexPageState();
}

class LoginIndexPageState extends State<LoginIndexPage> {
  // Declare variable
  final _formKey = GlobalKey<FormState>();

  // Declare controller
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  // Widget build
  @override
  Widget build(BuildContext context) {
    // Form input
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                // Input Username
                new TextFormField(
                  controller:
                      usernameCtrl, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Username';
                    }
                    return null;
                  },
                ),

                // Input Password
                new TextFormField(
                  controller:
                      passwordCtrl, // Disambungkan dengan controller tadi
                  keyboardType:
                      TextInputType.visiblePassword, // Tipe keyboard password
                  obscureText: true, // Masking password
                  decoration: new InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Password';
                    }
                    return null;
                  },
                ),

                // Submit button
                new Container(
                  child: new RaisedButton(
                    child: new Text(
                      'Login',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Jika validasi berhasil
                      if (_formKey.currentState.validate()) {
                        // Navigasi ke halaman home
                        Navigator.of(context).pushNamed("/Home");
                      }
                    },
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ));
  }
}
