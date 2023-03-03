import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login/controllers/profile_controller.dart';

import '../../models/user.dart';
import '../widgets/Info.dart';

class Profile extends StatelessWidget {
  List<String> itemsDropDown = ["Mexico", "USA", "Canada"];
  final controller = Get.put(ProfileController());
  final Users user;
  Profile({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
            child: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: const Text("Are you sure to delete?",
                              style: TextStyle(fontSize: 20)),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  controller.deleteUser();
                                },
                                child: const Text("Ok",
                                    style: TextStyle(fontSize: 20))),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Cancel",
                                    style: TextStyle(fontSize: 20))),
                          ],
                        ));
              },
            )),
      ),
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
              image: AssetImage("lib/assets/images/wallpaper3.jpg"),
              fit: BoxFit.cover),
        ),
        ListView(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 0),
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 50,
                            blurRadius: 100)
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(200),
                          topLeft: Radius.circular(200))),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      backgroundImage:
                          AssetImage("lib/assets/images/catUser.jpg"),
                    ),
                  ),
                )),
            Container(
              width: double.infinity,
              height: 700,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Info(
                            valueUser: user.fullName,
                            attribute: "fullName",
                            icon: Icons.person,
                            keyboard: TextInputType.name,
                            label: "Full name"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Info(
                            valueUser: user.email,
                            attribute: "email",
                            icon: Icons.email,
                            keyboard: TextInputType.emailAddress,
                            label: "Email"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          title: const Text("Birthday",
                              style: TextStyle(fontSize: 20)),
                          subtitle:
                              GetBuilder<ProfileController>(builder: (context) {
                            return Text(user.birthday,
                                style: const TextStyle(fontSize: 20));
                          }),
                          leading: const Icon(Icons.calendar_month,
                              size: 40, color: Colors.blue),
                          trailing: IconButton(
                              iconSize: 30,
                              color: Colors.black,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text("Edit",
                                              style: TextStyle(fontSize: 20)),
                                          content: TextFormField(
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              controller: controller.birthday,
                                              decoration: InputDecoration(
                                                hintText: "yyyy/mm/dd",
                                                hintStyle: const TextStyle(
                                                    fontSize: 20),
                                                constraints:
                                                    const BoxConstraints(
                                                        maxWidth: 250,
                                                        maxHeight: 50),
                                                border:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                suffixIcon: IconButton(
                                                    onPressed: () async {
                                                      DateTime? date =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate: DateTime
                                                                      .now()
                                                                  .subtract(
                                                                      const Duration(
                                                                          days:
                                                                              7300)),
                                                              lastDate: DateTime
                                                                  .now());
                                                      if (date != null) {
                                                        controller
                                                            .hanldeBirthday(
                                                                date);
                                                        user.birthday =
                                                            DateFormat(
                                                                    'yyyy/MM/dd')
                                                                .format(date);
                                                      }
                                                    },
                                                    icon: const Icon(Icons
                                                        .calendar_month_outlined)),
                                                suffixIconColor: Colors.blue,
                                              )),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  controller
                                                      .updateUser("birthday");
                                                },
                                                child: const Text(
                                                  "Ok",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("Cancel",
                                                    style: TextStyle(
                                                        fontSize: 20)))
                                          ],
                                        ));
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          title: const Text("Country",
                              style: TextStyle(fontSize: 20)),
                          subtitle:
                              GetBuilder<ProfileController>(builder: (context) {
                            return Text(user.country,
                                style: const TextStyle(fontSize: 20));
                          }),
                          leading: const Icon(Icons.location_on,
                              size: 40, color: Colors.blue),
                          trailing: IconButton(
                              iconSize: 30,
                              color: Colors.black,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text("Edit",
                                              style: TextStyle(fontSize: 20)),
                                          content:
                                              GetBuilder<ProfileController>(
                                                  builder: (context) {
                                            return DropdownButton(
                                                value: controller.country,
                                                items: itemsDropDown
                                                    .map((item) =>
                                                        DropdownMenuItem(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                            )))
                                                    .toList(),
                                                onChanged: (value) {
                                                  controller
                                                      .hanldeCountry(value);
                                                  user.country = value!;
                                                });
                                          }),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  controller
                                                      .updateUser("country");
                                                },
                                                child: const Text(
                                                  "Ok",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("Cancel",
                                                    style: TextStyle(
                                                        fontSize: 20)))
                                          ],
                                        ));
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                      )
                    ],
                  )),
            )
          ],
        )
      ]),
    );
  }
}
