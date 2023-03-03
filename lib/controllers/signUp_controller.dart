import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login/models/user.dart';

import '../presentation/screens/profile.dart';

class SignUpController extends GetxController {
  String uid = "";
  String email = "";
  String password = "";
  String fullName = "";
  DateTime? birthday;
  TextEditingController birthdayTxt = TextEditingController();
  String? country = "Mexico";
  bool termsConditions = false;
  double position = 0.0;
  double positionCat = -120;

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handlePassword(String newPassword) {
    password = newPassword;
    update();
  }

  handleFullName(String newFullName) {
    fullName = newFullName;
    update();
  }

  handleBirthday(DateTime newBirthday) {
    birthdayTxt.text = DateFormat('yyyy/MM/dd').format(newBirthday);
    birthday = newBirthday;
    update();
  }

  handleCountry(String newCountry) {
    country = newCountry;
    update();
  }

  hanldePosition(double newPosition) {
    if (newPosition > position) {
      positionCat = positionCat + .8;
    } else if (newPosition < position) {
      positionCat = positionCat - .8;
    }
    position = newPosition;
    update();
  }

  handleTermsConditions(bool newTermsConditions) {
    termsConditions = newTermsConditions;
    update();
  }

  handleSingUp() async {
    if (email == "" && password == "" && fullName == "") {
      return;
    }
    if (!termsConditions) {
      Get.snackbar(
          "Error", "Please, accept the Terms and Conditions to continue.",
          backgroundColor: Colors.red[200]);
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        final user = saveUser(credential.user!.uid);
        final id = credential.user!.uid;
        uid = id;
        Get.offAll(() => Profile(
              user: user,
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "The password provided is too weak.",
            backgroundColor: Colors.red[200]);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email.",
            backgroundColor: Colors.red[200]);
      }
    } catch (e) {
      print(e);
    }
  }

  Users saveUser(String id) {
    final user = Users(
        password: password,
        email: email,
        fullName: fullName,
        country: country!,
        birthday: birthdayTxt.text);
    final db = FirebaseFirestore.instance;
    db
        .collection("user")
        .doc(id)
        .set(user.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
    return user;
  }
}
