import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Writing());
}

class Writing extends StatelessWidget {
  const Writing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
              appBar: AppBar(
        title: const Text("Writing"),
        backgroundColor: const Color.fromARGB(255, 55, 57, 58),
        shadowColor: const Color.fromARGB(255, 55, 57, 58),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/home');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
        body: WritingContain(),
      ),
    );
  }
}

class WritingContain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 55, 57, 58), // Color outside the container
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Color.fromARGB(255, 48, 50, 51), // Color inside the container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to English Learning',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Start your journey to master English writing with our interactive lessons and exercises. Whether you are a beginner or looking to enhance your skills, we have resources for everyone.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
