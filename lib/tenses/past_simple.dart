import 'package:flutter/material.dart';

void main() {
  runApp(PastSimple());
}

class PastSimple extends StatelessWidget {
  const PastSimple({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Past Simple"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: PastSimpleContent(),
      ),
    );
  }
}

class PastSimpleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white; // Establecer el color de texto deseado
    Color purpleColor = Colors.purple; // Color morado

    return Container(
      color: Color.fromARGB(255, 55, 57, 58), // Color fuera del contenedor
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
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
                'Learn Past Simple Tense',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Explore the usage and structure of the past simple tense in English. Whether you are a beginner or looking to refine your skills, our lessons and exercises will help you master this important grammatical aspect.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Past Simple Lessons',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              PastSimpleLesson(
                  title: 'Introduction to Past Simple',
                  level: 'Beginner',
                  color: purpleColor),
              PastSimpleLesson(
                  title: 'Regular Verbs in the Past Simple',
                  level: 'Intermediate',
                  color: purpleColor),
              PastSimpleLesson(
                  title: 'Irregular Verbs in the Past Simple',
                  level: 'Advanced',
                  color: purpleColor),
              SizedBox(height: 40),
              Text(
                'Practice Past Simple',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              PastSimplePractice(
                  title: 'Complete the Sentences with Past Simple',
                  description:
                      'Fill in the blanks with the correct past simple form of the verbs.',
                  color: purpleColor),
              PastSimplePractice(
                  title: 'Narrate a Personal Experience',
                  description:
                      'Share a personal story using past simple tense.',
                  color: purpleColor),
            ],
          ),
        ),
        )
      ),
    );
  }
}

class PastSimpleLesson extends StatelessWidget {
  final String title;
  final String level;
  final Color color;

  const PastSimpleLesson(
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

class PastSimplePractice extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const PastSimplePractice(
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
        // Agregar funcionalidad para comenzar la práctica del pasado simple
      },
    );
  }
}
