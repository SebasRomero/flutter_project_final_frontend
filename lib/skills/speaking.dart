import 'package:flutter/material.dart';

void main() {
  runApp(Speaking());
}

class Speaking extends StatelessWidget {
  const Speaking({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Speaking"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SpeakingContain(),
      ),
    );
  }
}

class SpeakingContain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white; // Establecer el color de texto deseado

    return Container(
      color: Color.fromARGB(255, 55, 57, 58), // Color fuera del contenedor
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: 
          Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                Color.fromARGB(255, 48, 50, 51), // Color dentro del contenedor
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Improve Your English Speaking Skills',
                style: TextStyle(
                  color:
                      textColor, // Usar el mismo color de texto que en la pantalla de escritura
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Enhance your spoken English through interactive lessons and practice sessions. Whether you are a beginner or an advanced learner, our resources cater to all proficiency levels.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Interactive Lessons',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              LessonItem(
                  title: 'Lesson 1: Pronunciation and Intonation',
                  level: 'Beginner',
                  color: Colors.purple),
              LessonItem(
                  title: 'Lesson 2: Conversational English',
                  level: 'Intermediate',
                  color: Colors.purple),
              LessonItem(
                  title: 'Lesson 3: Public Speaking Techniques',
                  level: 'Advanced',
                  color: Colors.purple),
              SizedBox(height: 40),
              Text(
                'Practice Speaking',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              PracticeItem(
                  title: 'Participate in a Spoken English Session',
                  description: 'Improve fluency and expression.',
                  color: Colors.purple),
              PracticeItem(
                  title: 'Role Play and Dialogue Practice',
                  description: 'Enhance real-life conversation skills.',
                  color: Colors.purple),
            ],
          ),
        ),
        )
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
        // Agregar funcionalidad para navegar a los detalles de la lección
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
        // Agregar funcionalidad para comenzar la práctica de habla
      },
    );
  }
}
