import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
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
                            color: const Color.fromARGB(255, 157, 44, 209)),
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
                          child: const Text("Login",
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerEmail,
                              "Email",
                              TextInputType.text,
                              "Please, insert a valid email",
                              Icons.person,
                              "johndoe@hotmail.com"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerPassword,
                              "Password",
                              TextInputType.text,
                              "Please, insert a valid password",
                              Icons.password,
                              ""),
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
                                    loginUser();
                                  }
                                },
                                child: const Text("Login"),
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
                color:  Color.fromARGB(255, 157, 44, 209),
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:  Color.fromARGB(255, 157, 44, 209)),
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

  void loginUser() async {
    String email = controllerEmail.text;
    String password = controllerPassword.text;

    Map<dynamic, dynamic> request = {
      "username": email,
      "password": password,
    };
    final url = Uri.parse("http://localhost:3000/login");
    var response = await http.post(url, body: request);
    if (response.statusCode == 201) {
      // Parse the response to get relevant data
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String accessToken = responseData['access_token'];
      String username = responseData['username'];

      UserAuthentication userAuth =
          Provider.of<UserAuthentication>(context, listen: false);
          
      userAuth.setAuthenticationData(accessToken, username);
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid credentials. Please try again.'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
