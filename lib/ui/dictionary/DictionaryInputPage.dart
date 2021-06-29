import 'package:flutter/material.dart';
import 'package:latihan_api/entities/Dictionary.dart';

class DictionaryInputPage extends StatefulWidget {
  // Declare variable
  final Dictionary _dictionary;

  // Constructor ini memungkinkan class utk dipanggil dgn parameter
  DictionaryInputPage(this._dictionary);

  // Memanggil EntryFormState dengan parameter
  @override
  DictionaryInputPageState createState() =>
      DictionaryInputPageState(this._dictionary);
}

class DictionaryInputPageState extends State<DictionaryInputPage> {
  // Declare variable
  final _formKey = GlobalKey<FormState>();
  Dictionary _dictionary;

  // Constructor ini memungkinkan class utk dipanggil dgn parameter
  DictionaryInputPageState(this._dictionary);

  // Declare controller
  var wordController = TextEditingController();
  var descriptionController = TextEditingController();

  // Widget build
  @override
  Widget build(BuildContext context) {
    // Jika object tidak kosong,
    // maka isi dengan parameter yg ada
    // dgn kata lain ini parameter if untuk edit
    if (_dictionary != null) {
      wordController.text = _dictionary.word;
      descriptionController.text = _dictionary.description;
    }

    // Form input
    return Scaffold(
        appBar: AppBar(
          title: _dictionary == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                // Input Word
                new TextFormField(
                  controller:
                      wordController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Word'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Word';
                    }
                    return null;
                  },
                ),

                // Input Description
                new TextFormField(
                  controller:
                      descriptionController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Description';
                    }
                    return null;
                  },
                ),

                // Submit button
                new Container(
                  child: new RaisedButton(
                    child: new Text(
                      'Submit',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Jika validasi berhasil
                      if (_formKey.currentState.validate()) {
                        // Jika metode tambah
                        if (_dictionary == null) {
                          // tambah data
                          _dictionary = new Dictionary(
                              id: 0,
                              word: wordController.text,
                              description: descriptionController.text);
                        }
                        // Jika metode edit
                        else {
                          // ubah data
                          _dictionary.word = wordController.text;
                          _dictionary.description = descriptionController.text;
                        }

                        // kembali ke layar sebelumnya dengan membawa objek contact
                        Navigator.pop(context, _dictionary);
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
