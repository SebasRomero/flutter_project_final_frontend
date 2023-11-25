import 'package:flutter/material.dart';

void main() {
  runApp(Writing());
}

class Writing extends StatelessWidget {
  const Writing({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Writing"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
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
        child: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                Color.fromARGB(255, 48, 50, 51), // Color inside the container
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to English Learning',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Start your journey to master English writing with our interactive lessons and exercises. Whether you are a beginner or looking to enhance your skills, we have resources for everyone.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Interactive Lessons',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              LessonItem(
                  title: 'Lesson 1: Introduction to Writing',
                  level: 'Beginner',
                  color: Colors.purple),
              LessonItem(
                  title: 'Lesson 2: Crafting Engaging Stories',
                  level: 'Intermediate',
                  color: Colors.purple),
              LessonItem(
                  title: 'Lesson 3: Advanced Composition Techniques',
                  level: 'Advanced',
                  color: Colors.purple),
              SizedBox(height: 40),
              Text(
                'Practice Writing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              PracticeItem(
                  title: 'Write a Short Essay on a Chosen Topic',
                  description: 'Express your thoughts and opinions.',
                  color: Colors.purple),
              PracticeItem(
                  title: 'Grammar and Vocabulary Exercises',
                  description: 'Enhance your language skills.',
                  color: Colors.purple),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String title;
  final String level;
  final Color color;

  const LessonItem(
      {required this.title, required this.level, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Level: $level',
          style: TextStyle(color: color.withOpacity(0.8))),
      onTap: () {
        // Add functionality to navigate to the lesson details
      },
    );
  }
}

class PracticeItem extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const PracticeItem(
      {required this.title, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      subtitle:
          Text(description, style: TextStyle(color: color.withOpacity(0.8))),
      onTap: () {
        // Add functionality to start the writing practice
      },
    );
  }
}
