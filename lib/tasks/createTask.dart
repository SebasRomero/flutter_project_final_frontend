import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color.fromARGB(255, 157, 44, 209);
  }

  void clearFields() {
    setState(() {
      controllerTitle.clear();
      controllerDescription.clear();
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 55, 57, 58),
              child: Transform.rotate(
                angle: -20,
                child: Stack(
                  children: [
                    Positioned(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: MediaQuery.of(context).size.width + 100,
                          height: MediaQuery.of(context).size.width + 70,
                          color: const Color.fromARGB(255, 157, 44, 209),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 300,
                          height: MediaQuery.of(context).size.height + 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Center(
              child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    margin: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 55, 57, 58),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 55, 57, 58),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                          child: const Text("Register a new task",
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerTitle,
                              "Title",
                              TextInputType.text,
                              "",
                              Icons.title,
                              "Read something"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerDescription,
                              "Description",
                              TextInputType.text,
                              "",
                              Icons.text_snippet_outlined,
                              "Finish my today's lesson about present simple"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Is done already?",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 157, 44, 209),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 157, 44, 209)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    registerTask();
                                  }
                                },
                                child: const Text("Register"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 157, 44, 209),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                             Color.fromARGB(255, 157, 44, 209)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    clearFields();
                                  }
                                },
                                child: const Text("Restart"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/tasks');
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 157, 44, 209),
                                child: const Icon(Icons.arrow_back_ios),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget fieldsForm(TextEditingController cn, String label, TextInputType type,
      String err, IconData iconArgument, String hint) {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: cn,
        cursorColor: const Color.fromARGB(255, 157, 44, 209),
        keyboardType: type,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 94, 88, 88)),
            icon: Icon(iconArgument),
            iconColor: const Color.fromARGB(255, 157, 44, 209),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 157, 44, 209),
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 157, 44, 209)),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return err;
          }
          return null;
        });
  }

  void registerTask() async {
    UserAuthentication userAuth = Provider.of<UserAuthentication>(context, listen: false);
    String jwtToken = userAuth.accessToken!;
    String title = controllerTitle.text;
    String description = controllerDescription.text;
    bool isDone = isChecked;
    Map<dynamic, dynamic> request = {
      "title": title,
      "description": description,
      "done": isDone.toString()
    };
    final url = Uri.parse("http://localhost:3000/tasks");
    await http.post(url, body: request, headers:{ HttpHeaders.authorizationHeader: "Bearer $jwtToken"});
    _showMyDialog();
  }

Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext alertContext) {
      return AlertDialog(
        title: const Text('New task added!'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Do not forget to do it!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(alertContext).pop();
              Navigator.pushNamed(context, '/tasks');
            },
          ),
        ],
      );
    },
  );
}
}
