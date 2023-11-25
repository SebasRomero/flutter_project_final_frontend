import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EditBook extends StatefulWidget {
  const EditBook({super.key});

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAuthor = TextEditingController();
  String idBook = "";

  void clearFields() {
    setState(() {
      controllerName.clear();
      controllerAuthor.clear();
    });
  }

    void cargarInfo(String name, String author, String selectedGenre, String id) {
    setState(() {
      controllerName.text = name;
      controllerAuthor.text = author;
      selectedValue = selectedGenre;
      idBook = id;
    });
  }

  String selectedValue = 'Sci Fiction';

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arg = ModalRoute.of(context)?.settings.arguments as Map;
    cargarInfo(
        arg["name"], arg["author"], arg["genre"], arg["_id"].toString());
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
                          child: const Text("Edit your book!",
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerName,
                              "Name",
                              TextInputType.text,
                              "Please, insert a valid name",
                              Icons.title,
                              "Reading alone"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: fieldsForm(
                              controllerAuthor,
                              "Author name",
                              TextInputType.text,
                              "Please, insert a valid author name",
                              Icons.person,
                              "John Doe"),
                        ),
                        Container(
                            child: DropdownButton<String>(
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Sci Fiction',
                            'Thriller',
                            'Gore',
                            'Comedy'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
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
                                    editBook();
                                  }
                                },
                                child: const Text("Edit"),
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
                                  Navigator.pushNamed(context, '/books');
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
        cursorColor: const Color.fromARGB(255, 101, 0, 148),
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
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 157, 44, 209)),
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

  void editBook() async {
    UserAuthentication userAuth =
        Provider.of<UserAuthentication>(context, listen: false);
    String jwtToken = userAuth.accessToken!;
    String name = controllerName.text;
    String author = controllerAuthor.text;
    String id = idBook;
    Map<dynamic, dynamic> request = {
      "author": author,
      "name": name,
      "genre": selectedValue
    };
    final url = Uri.parse("http://localhost:3000/books/$id");
    await http.put(url, body: request, headers: {HttpHeaders.authorizationHeader: "Bearer $jwtToken"});
    _showMyDialog();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext alertContext) {
        return AlertDialog(
          title: const Text('Book edited!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your bookstore it is still great!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(alertContext).pop();
                Navigator.pushNamed(context, '/books');
              },
            ),
          ],
        );
      },
    );
  }
}
