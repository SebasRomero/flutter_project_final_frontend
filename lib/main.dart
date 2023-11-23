import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:frontend_flutter/auth/login.dart';
import 'package:frontend_flutter/auth/sign_up.dart';
import 'package:frontend_flutter/books/booksMain.dart';
import 'package:frontend_flutter/books/createBook.dart';
import 'package:frontend_flutter/books/editBook.dart';
import 'package:frontend_flutter/homepage.dart';
import 'package:frontend_flutter/presentationPage.dart';
import 'package:frontend_flutter/skills/writing.dart';
import 'package:frontend_flutter/tasks/createTask.dart';
import 'package:frontend_flutter/tasks/editTask.dart';
import 'package:frontend_flutter/tasks/tasksMain.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EnglishApp(),
    );
  }
}

class EnglishApp extends StatefulWidget {
  const EnglishApp({super.key});

  @override
  State<EnglishApp> createState() => _EnglishAppState();
}

class _EnglishAppState extends State<EnglishApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserAuthentication(),
      child: MaterialApp(
        title: 'Your App',
        routes: {
          "/": (context) => const Presentation(),
          "/signup": (context) => const Register(),
          "/login": (context) => const Login(),
          "/home": (context) => const Home(),
          //books
          "/books": (context) => const BooksHome(),
          "/books/create": (context) => const CreateBook(),
          "/books/edit": (context) => const EditBook(),
          //tasks
          "/tasks": (context) => const TasksHome(),
          "/tasks/create": (context) => const CreateTask(),
          "/tasks/edit": (context) => const EditTask(),

          "/writing": (context) => const Writing(),
        },
      ),
    );
  }
}
