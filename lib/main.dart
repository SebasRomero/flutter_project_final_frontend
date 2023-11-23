import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:frontend_flutter/auth/login.dart';
import 'package:frontend_flutter/auth/sign_up.dart';
import 'package:frontend_flutter/books/booksMain.dart';
import 'package:frontend_flutter/books/createBook.dart';
import 'package:frontend_flutter/books/editBook.dart';
import 'package:frontend_flutter/homepage.dart';
import 'package:frontend_flutter/presentationPage.dart';
import 'package:frontend_flutter/skills/listening.dart';
import 'package:frontend_flutter/skills/reading.dart';
import 'package:frontend_flutter/skills/speaking.dart';
import 'package:frontend_flutter/skills/writing.dart';
import 'package:frontend_flutter/tasks/createTask.dart';
import 'package:frontend_flutter/tasks/tasksMain.dart';
import 'package:frontend_flutter/tenses/past_continuos.dart';
import 'package:frontend_flutter/tenses/past_perfect.dart';
import 'package:frontend_flutter/tenses/past_simple.dart';
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
          "/": (context) => const Home(),
          "/signup": (context) => const Register(),
          "/login": (context) => const Login(),
          "/home": (context) => const Home(),
          "/books": (context) => const BooksHome(),
          "/books/create": (context) => const CreateBook(),
          "/books/edit": (context) => const EditBook(),
          "/tasks": (context) => const TasksHome(),
          "/tasks/create": (context) => const CreateTask(),
          "/writing": (context) => const Writing(),
          "/speaking": (context) => const Speaking(),
          "/reading": (context) => const Reading(),
          "/listening": (context) => const Listening(),
          "/past_simple": (context) => const PastSimple(),
          "/past_continuos": (context) => const PastContinuous(),
          "/past_perfect": (context) => const PastPerfect(),
        },
      ),
    );
  }
}
