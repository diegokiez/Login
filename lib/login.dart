import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                padding: EdgeInsets.all(40.0),
                child: Text("Welcome",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ),
              const Text("Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 14),
                        constraints:
                            BoxConstraints(maxWidth: 250, maxHeight: 40),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
              ),
              const Text("Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 14),
                        constraints:
                            BoxConstraints(maxWidth: 250, maxHeight: 40),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: const Text("Remember me",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis),
                              trailing: Checkbox(
                                  value: valueCheckBox,
                                  onChanged: (value) {
                                    setState(() {
                                      valueCheckBox = value;
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
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login in"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text("or", textAlign: TextAlign.center),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 85, 85, 85))),
                  onPressed: () {
                    Navigator.of(context).pushNamed('registro');
                  },
                  child: const Text("Sign up"),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
