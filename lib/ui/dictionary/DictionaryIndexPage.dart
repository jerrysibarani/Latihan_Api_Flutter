import 'package:flutter/material.dart';
import 'package:latihan_api/models/Mdictionary.dart';
import 'package:latihan_api/entities/Dictionary.dart';
import 'package:latihan_api/ui/fragment/MenuFragment.dart';
import 'package:latihan_api/ui/Dictionary/DictionaryInputPage.dart';
import 'dart:async';

class DictionaryIndexPage extends StatefulWidget {
  @override
  DictionaryIndexPageState createState() => DictionaryIndexPageState();
}

class DictionaryIndexPageState extends State<DictionaryIndexPage> {
  // Declare variable
  var _mdictionary = new Mdictionary();
  int count = 0;
  List<Dictionary> dictionaryList;

  @override
  Widget build(BuildContext context) {
    // If list is null, the initialize list
    if (dictionaryList == null) {
      dictionaryList = List<Dictionary>();
    }

    // Perintah di dalam Future microtask
    // akan dieksekusi setelah scaffold selesai dibuat
    Future.microtask(() {
      // Memanggil perintah update list view
      this.updateListView();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('List Dictionary'),
      ),
      drawer: MenuFragment(),
      body: createListView(),

      // floatingActionButton disini adalah tombol mengambang (+)
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          // Munculkan pop up form input
          // Jika hasilnya bukan null, maka tambahkan data
          var contact = await pushAndGetFormInputResult(context, null);
          if (contact != null) addData(contact);
        },
      ),
    );
  }

  // Fungsi untuk memunculkan pop up form input
  // Dan memberikan return hasilnya berupa entity Dictionary
  Future<Dictionary> pushAndGetFormInputResult(
      BuildContext context, Dictionary contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return DictionaryInputPage(contact);
    }));
    return result;
  }

  // Fungsi ini digunakan untuk menampilkan list view
  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 45,
            ),
            title: Text(
              this.dictionaryList[index].word,
              style: textStyle,
            ),
            subtitle: Text(this.dictionaryList[index].description),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                // Menghapus data ketika icon delete diketuk
                deleteData(dictionaryList[index]);
              },
            ),
            onTap: () async {
              // Memunculkan data ketika nama diketuk
              // Pop up akan dimunculkan dan melakukan return berupa entity Dictionary
              // Lalu dilanjutkan jika dictionary tidak null, maka update data
              var contact = await pushAndGetFormInputResult(
                  context, this.dictionaryList[index]);
              if (contact != null) editData(contact);
            },
          ),
        );
      },
    );
  }

  // Fungsi untuk menambahkan dictionary ke API dan mengupdate list view
  void addData(Dictionary object) async {
    int result = await _mdictionary.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk mengubah dictionary ke API dan mengupdate list view
  void editData(Dictionary object) async {
    int result = await _mdictionary.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk menghapus dictionary dari API dan mengupdate list view
  void deleteData(Dictionary object) async {
    int result = await _mdictionary.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk mengupdate list view
  void updateListView() {
    Future<List<Dictionary>> dictionaryListFuture = _mdictionary.getList();

    dictionaryListFuture.then((resultList) {
      setState(() {
        this.dictionaryList = resultList;
        this.count = resultList.length;
      });
    });
  }
}
