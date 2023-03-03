import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String fullName;
  String country;
  String password;
  String email;
  String birthday;
  Users(
      {required this.password,
      required this.email,
      required this.fullName,
      this.country = "Mexico",
      this.birthday = ""});

  factory Users.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Users(
      email: data?['email'],
      password: data?['password'],
      fullName: data?['fullName'],
      birthday: data?['birthday'],
      country: data?['country'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "password": password,
      "fullName": fullName,
      "birthday": birthday,
      "country": country,
    };
  }
}
