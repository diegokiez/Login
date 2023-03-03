import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';
import '../../models/user.dart';

class Info extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  final String label;
  final String attribute;
  final TextInputType keyboard;
  final IconData icon;
  String valueUser;
  Info({
    super.key,
    required this.label,
    required this.attribute,
    required this.keyboard,
    required this.icon,
    required this.valueUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 20)),
      subtitle: GetBuilder<ProfileController>(builder: (context) {
        return Text(valueUser, style: const TextStyle(fontSize: 20));
      }),
      leading: Icon(icon, size: 40, color: Colors.blue),
      trailing: IconButton(
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text("Edit", style: TextStyle(fontSize: 20)),
                      content: TextField(
                        keyboardType: keyboard,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(hintText: label),
                        onChanged: (value) {
                          valueUser = value;
                          if (attribute == "fullName") {
                            controller.hanldeFullName(value);
                          } else {
                            controller.hanldeEmail(value);
                          }
                        },
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              controller.updateUser(attribute);
                            },
                            child: const Text(
                              "Ok",
                              style: TextStyle(fontSize: 20),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Cancel",
                                style: TextStyle(fontSize: 20)))
                      ],
                    ));
          },
          icon: const Icon(Icons.edit)),
    );
  }
}
