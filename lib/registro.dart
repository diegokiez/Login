import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  double position = -70;
  bool? valueCheckBox = false;
  double valueSlide = 0;
  TextEditingController birthday = TextEditingController();
  List<String> itemsDropDown = ["Mexico", "USA", "Canada"];
  String? valueDropDown = "Mexico";
  bool? valueSwitch = false;
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
                  title: const Text("Sign up", style: TextStyle(fontSize: 30)),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blue,
                      )),
                ),
              ),
              Row(
                children: const [
                  WidgetLabel(text: "Email"),
                  WidgetField(
                    text: "Email",
                    keyboard: TextInputType.emailAddress,
                  )
                ],
              ),
              Row(
                children: const [
                  WidgetLabel(text: "Password"),
                  WidgetField(
                    text: "Password",
                    obscure: true,
                  )
                ],
              ),
              Row(
                children: const [
                  WidgetLabel(text: "Full name"),
                  WidgetField(
                    text: "Full name",
                  )
                ],
              ),
              Row(
                children: [
                  const WidgetLabel(text: "Birthday"),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
                    child: TextFormField(
                        controller: birthday,
                        decoration: InputDecoration(
                          hintText: "yyyy/mm/dd",
                          hintStyle: const TextStyle(fontSize: 14),
                          constraints: const BoxConstraints(
                              maxWidth: 250, maxHeight: 40),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? fecha = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 3650)),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 3650)));
                                if (fecha != null) {
                                  setState(() {
                                    birthday.text =
                                        DateFormat('yyyy/MM/dd').format(fecha);
                                  });
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
                      padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
                      child: DropdownButton(
                          value: valueDropDown,
                          items: itemsDropDown
                              .map((item) => DropdownMenuItem(
                                  value: item, child: Text(item)))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              valueDropDown = value;
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
                      padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
                      child: Slider(
                          max: 1,
                          min: 0,
                          value: valueSlide,
                          onChanged: ((value) {
                            setState(() {
                              if (value > valueSlide) {
                                position = position + .2;
                              } else if (value < valueSlide) {
                                position = position - .2;
                              }
                              valueSlide = value;
                            });
                          })),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 10, 12, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("I accept the Terms and Conditions",
                            style: TextStyle(
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
                        child: SwitchListTile(
                            value: valueSwitch!,
                            onChanged: (value) {
                              setState(() {
                                valueSwitch = value;
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
                    onPressed: () {},
                    child:
                        const Text("Register", style: TextStyle(fontSize: 25)),
                  ),
                ),
              )
            ]),
          ),
        ),
        Positioned(
          top: 70,
          right: position,
          child: const SizedBox(
              width: 80,
              child: Image(image: AssetImage("lib/assets/images/cat.png"))),
        )
      ]),
    );
  }
}

class WidgetField extends StatelessWidget {
  final String text;
  final bool obscure;
  final TextInputType keyboard;
  const WidgetField({
    super.key,
    required this.text,
    this.obscure = false,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 45, 0),
      child: TextFormField(
          keyboardType: keyboard,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(fontSize: 14),
              constraints: const BoxConstraints(maxWidth: 250, maxHeight: 40),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
    ));
  }
}

class WidgetLabel extends StatelessWidget {
  final String text;
  const WidgetLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 10, 12, 0),
      child: SizedBox(width: 60, child: Text(text)),
    );
  }
}
