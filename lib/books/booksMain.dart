import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:frontend_flutter/books/createBook.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const BooksHome());
}

class BooksHome extends StatefulWidget {
  const BooksHome({super.key});

  @override
  State<BooksHome> createState() => _BooksHomeState();
}

class _BooksHomeState extends State<BooksHome> {
  List<Map<String, dynamic>> books = [];

  getJWT() {
          UserAuthentication userAuth = Provider.of<UserAuthentication>(context, listen: false);
      String jwtToken = userAuth.accessToken!;
      return jwtToken;
  }
  getBooks() async {
      String jwtToken = getJWT();
    var url = Uri.parse("http://localhost:3000/books");
    http.Response response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: "Bearer $jwtToken"
    });
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      
      List<Map<String, dynamic>> bookData = jsonResponse.map((item) {
        return Map<String, dynamic>.from(item);
      }).toList();

      setState(() {
        books = bookData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My books"),
        backgroundColor: const Color.fromARGB(255, 55, 57, 58),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/home');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Color.fromARGB(255, 55, 57, 58),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          margin: const EdgeInsets.all(3),
          child: ListTile(
            isThreeLine: true,
            title: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(books[index]["name"],
                        style: const TextStyle(color: Colors.black, fontSize: 14)),
                  ]),
            ),
            subtitle: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [Text(books[index]["author"],
                  style: const TextStyle(color: Colors.black, fontSize: 14))],
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                  child: Column(
                    children: [
                      Text(books[index]["genre"],
                  style: const TextStyle(color: Colors.black, fontSize: 14))
                    ],
                  )),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/books/edit', arguments: {
                      "name": books[index]["name"],
                      "author": books[index]["author"],
                      "genre": books[index]["genre"],
                      "_id": books[index]["_id"],
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Book"),
                            content: const Text(
                                "Are you sure you want to delete this book?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () async {
                                    String id = books[index]["_id"];
                                    String jwtToken = getJWT();
                                    final url = Uri.parse("http://localhost:3000/books/$id");
                                    await http.delete(url, headers: {HttpHeaders.authorizationHeader: "Bearer $jwtToken"});
                                    getBooks();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Delete"))
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 157, 44, 209),
                  ),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 157, 44, 209),
        onPressed: () {
          Navigator.pushNamed(context, '/books/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
