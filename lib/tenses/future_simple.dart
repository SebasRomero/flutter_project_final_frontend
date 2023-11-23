import 'package:flutter/material.dart';

void main() {
  runApp(FutureSimple());
}

class FutureSimple extends StatelessWidget {
  const FutureSimple({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Future Simple"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: FutureSimpleContent(),
      ),
    );
  }
}

class FutureSimpleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white; // Establecer el color de texto deseado
    Color purpleColor = Colors.purple; // Color morado

    return Container(
      color: Color.fromARGB(255, 55, 57, 58), // Color fuera del contenedor
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
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
                'Learn Future Simple Tense',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Explore the usage and structure of the future simple tense in English. Whether you are a beginner or looking to refine your skills, our lessons and exercises will help you master this important grammatical aspect.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Future Simple Lessons',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              FutureSimpleLesson(
                  title: 'Introduction to Future Simple',
                  level: 'Beginner',
                  color: purpleColor),
              FutureSimpleLesson(
                  title: 'Forming the Future Simple Tense',
                  level: 'Intermediate',
                  color: purpleColor),
              FutureSimpleLesson(
                  title: 'Using Future Simple in Context',
                  level: 'Advanced',
                  color: purpleColor),
              SizedBox(height: 40),
              Text(
                'Practice Future Simple',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              FutureSimplePractice(
                  title: 'Complete the Sentences with Future Simple',
                  description:
                      'Fill in the blanks with the correct future simple form of the verbs.',
                  color: purpleColor),
              FutureSimplePractice(
                  title: 'Describe Your Future Plans',
                  description:
                      'Narrate your future plans using future simple tense.',
                  color: purpleColor),
            ],
          ),
        ),
      ),
    );
  }
}

class FutureSimpleLesson extends StatelessWidget {
  final String title;
  final String level;
  final Color color;

  const FutureSimpleLesson(
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

class FutureSimplePractice extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const FutureSimplePractice(
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
        // Agregar funcionalidad para comenzar la práctica del futuro simple
      },
    );
  }
}
