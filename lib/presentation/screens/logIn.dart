import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/login_controller.dart';
import 'package:login/presentation/screens/signUp.dart';

class LogIn extends StatelessWidget {
  final controller = Get.put(LoginController());
  bool? valueCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
              image: AssetImage("lib/assets/images/wallpaper2.png"),
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
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text("Welcome",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              ),
              const Text("Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 20),
                      constraints: BoxConstraints(maxWidth: 250, maxHeight: 50),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onChanged: controller.handleEmail,
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              const Text("Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 20),
                        constraints:
                            BoxConstraints(maxWidth: 250, maxHeight: 50),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onChanged: controller.handlePassword),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 2000,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                          child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Remember me",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis),
                              trailing: GetBuilder<LoginController>(
                                  builder: (context) {
                                return Checkbox(
                                    value: controller.remember,
                                    onChanged: (value) {
                                      controller.handleRemember(value!);
                                    });
                              })),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot pasword?",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(15)),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () => controller.handleLogin(),
                  child: const Text("Login in", style: TextStyle(fontSize: 30)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("or",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 85, 85, 85))),
                  onPressed: () {
                    Get.to(SingUp());
                  },
                  child: const Text("Sign up", style: TextStyle(fontSize: 30)),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
