import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

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
                            color: Color.fromARGB(255, 101, 0, 148)),
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
                          child: const Text("Register",
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerEmail,
                              "Username",
                              TextInputType.text,
                              "Please, insert a valid username",
                              Icons.person,
                              "johndoe22", false),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerName,
                              "Name",
                              TextInputType.name,
                              "Please, insert a valid name",
                              Icons.person,
                              "John", false),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerPhone,
                              "Phone",
                              TextInputType.text,
                              "Please, insert a valid phone",
                              Icons.phone,
                              "3001132445", false),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerPassword,
                              "Password",
                              TextInputType.text,
                              "Please, insert a valid password",
                              Icons.password,
                              "", true),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 101, 0, 148),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 101, 0, 148)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    registerUser();
                                  }
                                },
                                child: const Text("Register"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 101, 0, 148),
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
      String err, IconData iconArgument, String hint, bool obscureT) {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: cn,
        cursorColor: const Color.fromARGB(255, 101, 0, 148),
        obscureText: obscureT,
        keyboardType: type,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 94, 88, 88)),
            icon: Icon(iconArgument),
            iconColor: const Color.fromARGB(255, 101, 0, 148),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 101, 0, 148),
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 101, 0, 148)),
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

  void registerUser() async {
    String email = controllerEmail.text;
    String name = controllerName.text;
    String phone = controllerPhone.text;
    String password = controllerPassword.text;

    Map<dynamic, dynamic> request = {
      "username": email,
      "name": name,
      "password": password,
      "phone": phone,
    };
    final url = Uri.parse("http://localhost:3000/signup");
    var response = await http.post(url, body: request);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == HttpStatus.created) {
      _showMyDialog();
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String accessToken = responseData['access_token'];
      String username = responseData['username'];
      UserAuthentication userAuth =
          Provider.of<UserAuthentication>(context, listen: false);

      userAuth.setAuthenticationData(accessToken, username);
    }
    ;
    if (response.statusCode == HttpStatus.badRequest) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User already exist'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext alertContext) {
        return AlertDialog(
          title: const Text('User created succesfully'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('It is time to learn!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(alertContext).pop();
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        );
      },
    );
  }
}
