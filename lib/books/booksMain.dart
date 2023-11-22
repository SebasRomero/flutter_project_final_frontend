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

  getBooks() async {
      UserAuthentication userAuth = Provider.of<UserAuthentication>(context, listen: false);
      String jwtToken = userAuth.accessToken!;
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
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(books[index]["name"],
                        style: const TextStyle(color: Colors.black)),
                  ]),
            ),
            subtitle: Container(
              padding: const EdgeInsets.all(5),
              child: Text(books[index]["author"],
                  style: const TextStyle(color: Colors.black, fontSize: 14)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit', arguments: {
                      "title": books[index]["title"],
                      "description": books[index]["description"],
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
                                    final url = Uri.parse("http://localhost:3000/books/$id");
                                    await http.delete(url);
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
