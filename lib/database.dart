import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

// class Database {
//   String username;
//   dynamic password;
//   Database({required this.username, required this.password});

//   final firestore = FirebaseFirestore.instance;

//   Future<Map<String, dynamic>> getinfo() async {
//     Map<String, dynamic> data = {"username": username, "password": password};
//     // CollectionReference credential =
//     //     FirebaseFirestore.instance.collection('credentials');
//     // credential.add(data);

//     try {
//       await firestore.collection('credentials').add(data);
//     } catch (e) {
//       log(e.toString());
//     }
//     return data;
//   }
// }

class Database {
  String username;
  dynamic password;
  Database({required this.username, required this.password});

  final firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getInfo() async {
    final Map<String, dynamic> data = {
      'userName': username,
      'passWord': password
    };
    try {
      firestore.collection('credentials').add(data);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }
}
