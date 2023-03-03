import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/presentation/screens/profile.dart';

import '../models/user.dart';

class LoginController extends GetxController {
  String uid = "";
  String email = "";
  String password = "";
  bool remember = false;

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handlePassword(String newPassword) {
    password = newPassword;
    update();
  }

  handleRemember(bool newRemember) {
    remember = newRemember;
    update();
  }

  handleLogin() async {
    if (email == "" && password == "") {
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        Users? user = await getUser(credential.user!.uid);
        String id = credential.user!.uid;
        uid = id;
        if (user != null) {
          Get.offAll(() => Profile(
                user: user,
              ));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar("Error", "The email address is badly formatted.",
            backgroundColor: Colors.red[200]);
      } else if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.",
            backgroundColor: Colors.red[200]);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.",
            backgroundColor: Colors.red[200]);
      }
    }
  }

  Future<Users?> getUser(String id) async {
    Users user;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("user").doc(id);
    user =
        await docRef.get().then((DocumentSnapshot<Map<String, dynamic>> doc) {
      return Users.fromFirestore(doc);
    }, onError: (e) => print("Error getting document: $e"));
    return user;
  }
}
