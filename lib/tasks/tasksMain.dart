import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:frontend_flutter/tasks/createTask.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const TasksHome());
}

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  List<Map<String, dynamic>> tasks = [];

  getTasks() async {
    UserAuthentication userAuth =
        Provider.of<UserAuthentication>(context, listen: false);
    String jwtToken = userAuth.accessToken!;
    var url = Uri.parse("http://localhost:3000/tasks");
    http.Response response = await http.get(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer $jwtToken"});
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body);

      List<Map<String, dynamic>> taskData = jsonResponse.map((item) {
        return Map<String, dynamic>.from(item);
      }).toList();

      print(taskData);
      setState(() {
        tasks = taskData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    return const Color.fromARGB(255, 157, 44, 209);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My tasks"),
        backgroundColor: const Color.fromARGB(255, 55, 57, 58),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Color.fromARGB(255, 55, 57, 58),
      body: ListView.builder(
        itemCount: tasks.length,
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
                    Text(tasks[index]["title"],
                        style: const TextStyle(color: Colors.black)),
                  ]),
            ),
            subtitle: Container(
              padding: const EdgeInsets.all(5),
              child: Text(tasks[index]["description"],
                  style: const TextStyle(color: Colors.black, fontSize: 14)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 7, 130, 0),
                    child: Column(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: tasks[index]["done"],
                          onChanged: (bool? value) {},
                        ),
                      ],
                    )),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit', arguments: {
                      "title": tasks[index]["title"],
                      "description": tasks[index]["description"],
                      "done": tasks[index]["done"],
                      "_id": tasks[index]["_id"],
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
                            title: const Text("Delete Task"),
                            content: const Text(
                                "Are you sure you want to delete this task?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () async {
                                    String id = tasks[index]["_id"];
                                    final url = Uri.parse(
                                        "http://localhost:3000/tasks/$id");
                                    await http.delete(url);
                                    getTasks();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Delete"))
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 157, 44, 209),
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
          Navigator.pushNamed(context, '/tasks/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
