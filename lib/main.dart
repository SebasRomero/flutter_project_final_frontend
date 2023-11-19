import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:frontend_flutter/auth/login.dart';
import 'package:frontend_flutter/auth/sign_up.dart';
import 'package:frontend_flutter/homepage.dart';
import 'package:frontend_flutter/presentationPage.dart';
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
          "/home": (context) => const Home()
        },
      ),
    );
  }
}
