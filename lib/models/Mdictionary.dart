import 'dart:async';

import 'package:latihan_api/entities/Dictionary.dart';
import 'package:latihan_api/configs/constants.dart';
import 'package:http/http.dart' as http; // Dependecies untuk http
import 'dart:convert'; // Depedencies untuk json

// Class model dictionary
// Ini berfungsi untuk menghubungkan dari entity Dictionary ke Model Dictionary
// Di mana Model Dictionary akan terhubung ke API
class Mdictionary {
  // Select dictionary
  //Future<List<Map<String, dynamic>>> select() async {
  //  var url = apiUrlAddress + "index.php/myapi/kamus_api";
  //  http.get(url, body: {
  //    "id": _object.id,
  //  });
  //  return 1;
  // }

  Future<Dictionary> select(int id) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api?id" + id.toString();

    final response = await http.get(url);
    // Mapping dari json ke entity list
    List<Dictionary> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Dictionary.fromJson(i))
        .toList();

    // Return null jika data tidak ditemukan
    if (objectList[0] == null) {
      return null;
    }
    // Return object jika data ditemukan
    else {
      return objectList[0];
    }
  }

  // Insert dictionary ke:
  // http://jerrysibarani.com/androidserverapi/index.php/myapi/kamus_api
  Future<int> insert(Dictionary _object) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";

    http.post(url,
        body: {"word": _object.word, "description": _object.description});

    return 1;
  }

  // Update dictionary ke:
  // http://jerrysibarani.com/androidserverapi/index.php/myapi/kamus_api
  Future<int> update(Dictionary _object) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";
    http.put(url, body: {
      "id": _object.id.toString(),
      "word": _object.word,
      "description": _object.description
    });

    return 0;
  }

  // Delete dictionary
  Future<int> delete(int id) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api_delete";

    http.post(url, body: {'id': id.toString()});
    return 0;
  }

  // Get List dari:
  // http://jerrysibarani.com/androidserverapi/index.php/myapi/kamus_api
  Future<List<Dictionary>> getList() async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";
    final response = await http.get(url);

    // Mapping dari json ke entity list
    List<Dictionary> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Dictionary.fromJson(i))
        .toList();

    return objectList;
  }

  // Kita saat ini tidak gunakan fungsi ini pada API
  Future isReady() async {
    return true;
  }
}
