import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login/presentation/screens/logIn.dart';

import '../models/user.dart';

class ProfileController extends GetxController {
  String country = "Mexico";
  TextEditingController birthday = TextEditingController();

  Map attributes = {
    "fullName": "",
    "email": "",
    "birthday": "",
    "country": "",
  };

  hanldeCountry(newCountry) {
    country = newCountry;
    attributes["country"] = newCountry;
    update();
  }

  hanldeFullName(newFullName) {
    attributes["fullName"] = newFullName;
  }

  hanldeEmail(newEmail) {
    attributes["email"] = newEmail;
  }

  hanldeBirthday(DateTime newBirthday) {
    birthday.text = DateFormat('yyyy/MM/dd').format(newBirthday);
    attributes["birthday"] = birthday.text;
    update();
  }

  updateUser(String attribute) async {
    final db = FirebaseFirestore.instance;
    final washingtonRef =
        db.collection("user").doc(FirebaseAuth.instance.currentUser!.uid);
    await washingtonRef.update({attribute: attributes[attribute]}).then(
        (value) => print("DocumenSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
    if (attribute == "email") {
      FirebaseAuth.instance.currentUser!.updateEmail(attributes[attribute]);
    }
    Get.back();
    update();
  }

  deleteUser() {
    final db = FirebaseFirestore.instance;
    db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete()
        .then((doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"));

    FirebaseAuth.instance.currentUser!.delete();
    Get.offAll(() => LogIn());
  }
}
