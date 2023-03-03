import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/signUp_controller.dart';

import '../widgets/field.dart';
import '../widgets/label.dart';

class SingUp extends StatelessWidget {
  final controller = Get.put(SignUpController());
  List<String> itemsDropDown = ["Mexico", "USA", "Canada"];

  SingUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
              image: AssetImage("lib/assets/images/wallpaper.jpg"),
              fit: BoxFit.cover),
        ),
        Container(
          margin: const EdgeInsets.all(60),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, spreadRadius: 50, blurRadius: 100)
              ],
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Center(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 25, 12, 25),
                child: ListTile(
                  title: const Text("Sign up", style: TextStyle(fontSize: 40)),
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blue,
                      )),
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                      radius: 85,
                      backgroundImage:
                          AssetImage("lib/assets/images/catUser.jpg"))),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  const WidgetLabel(text: "Email"),
                  WidgetField(
                    text: "Email",
                    keyboard: TextInputType.emailAddress,
                    function: (value) {
                      controller.handleEmail(value);
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Password"),
                  WidgetField(
                    text: "Password",
                    obscure: true,
                    function: (value) {
                      controller.handlePassword(value);
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Full name"),
                  WidgetField(
                    text: "Full name",
                    function: (value) {
                      controller.handleFullName(value);
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Birthday"),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 45, 0),
                    child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        controller: controller.birthdayTxt,
                        decoration: InputDecoration(
                          hintText: "yyyy/mm/dd",
                          hintStyle: const TextStyle(fontSize: 20),
                          constraints: const BoxConstraints(
                              maxWidth: 250, maxHeight: 50),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 7300)),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  controller.handleBirthday(date);
                                }
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                          suffixIconColor: Colors.blue,
                        )),
                  ))
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Country"),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 20, 45, 0),
                      child: GetBuilder<SignUpController>(builder: (context) {
                        return DropdownButton(
                            value: controller.country,
                            items: itemsDropDown
                                .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 20),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              controller.handleCountry(value!);
                            });
                      }),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Slide me"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 20, 45, 0),
                      child: GetBuilder<SignUpController>(builder: (context) {
                        return Slider(
                            max: 1,
                            min: 0,
                            value: controller.position,
                            onChanged: ((value) {
                              controller.hanldePosition(value);
                            }));
                      }),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 12, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("I accept the Terms and Conditions",
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
                        child: GetBuilder<SignUpController>(builder: (context) {
                          return SwitchListTile(
                              value: controller.termsConditions,
                              onChanged: (value) {
                                controller.handleTermsConditions(value);
                              });
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.handleSingUp();
                    },
                    child:
                        const Text("Register", style: TextStyle(fontSize: 30)),
                  ),
                ),
              )
            ]),
          ),
        ),
        GetBuilder<SignUpController>(builder: (context) {
          return Positioned(
            top: 70,
            right: controller.positionCat,
            child: const SizedBox(
                width: 150,
                child: Image(image: AssetImage("lib/assets/images/cat.png"))),
          );
        })
      ]),
    );
  }
}
