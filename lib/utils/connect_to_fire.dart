import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/event_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectToFire {
  final user = FirebaseFirestore.instance.collection('users');
  final firestore = FirebaseFirestore.instance.collection('events');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  late SharedPreferences? pref;

  Future<String?> uploadPic(File image, String des) async {
    try {
      Reference reference = _storage.ref().child("images/$des");

      reference.putFile(image);

      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to upload image");
      return null;
    }
  }

  Future<String?> uploadPicEvent(File image) async {
    try {
      Reference reference = _storage.ref().child("events/${DateTime.now()}");

      reference.putFile(image);

      String url = await reference.getDownloadURL().whenComplete(() => null);
      log(url);
      return url;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to upload image");
      return null;
    }
  }

  Future<void> saveData(String? dpUrl, String name) async {
    final chatInGlobal = {
      'dpUrl': dpUrl,
      'name': name,
      'createdAt': DateTime.now(),
    };
    await user.doc().set(chatInGlobal);
    return;
  }

  Future<void> saveEvent(String? eventImage, String task, String date,
      String start, String end, String des) async {
    final chatInGlobal = {
      'eventImage': eventImage,
      'task': task,
      'date': date,
      'start': start,
      'end': end,
      'des': des,
      'createdAt': DateTime.now(),
    };
    await firestore.doc().set(chatInGlobal);
    return;
  }

  Future<List<EventModel>> getEvetnts() async {
    List<EventModel> modelList = [];
    var querySnapshot = await firestore.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      print("1212 ${data.keys}");
      modelList.add(EventModel(
          des: data['des'] ?? "Description",
          date: data['date'] ?? "Date",
          image: data['eventImage'] ?? "",
          title: data['task'] ?? "Task",
          startTime: data['start'] ?? "Start",
          endTime: data['end'] ?? "End"));
    }
    return modelList;
  }
}
