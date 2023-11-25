import 'package:flutter/material.dart';

void main() {
  runApp(Listening());
}

class Listening extends StatelessWidget {
  const Listening({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Listening"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListeningContain(),
      ),
    );
  }
}

class ListeningContain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white; // Establecer el color de texto deseado

    return Container(
      color: Color.fromARGB(255, 55, 57, 58), // Color fuera del contenedor
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 48, 50, 51), // Color dentro del contenedor
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Improve Your Listening Skills',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Enhance your listening comprehension with our diverse collection of audio materials. Whether you are a beginner or an advanced listener, our resources cover a wide range of topics and difficulty levels.',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40),
                Text(
                  'Featured Audio',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                AudioItem(
                    title: 'Podcast: The Art of Communication',
                    duration: '15 mins',
                    color: Colors.purple),
                AudioItem(
                    title: 'Language Learning Dialogue: Everyday Situations',
                    duration: '20 mins',
                    color: Colors.purple),
                AudioItem(
                    title: 'News Brief: Current Events',
                    duration: '10 mins',
                    color: Colors.purple),
                SizedBox(height: 40),
                Text(
                  'Listening Exercises',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ExerciseItem(
                    title: 'Listening Comprehension Quiz: Interviews',
                    description: 'Test your understanding of spoken interviews.',
                    color: Colors.purple),
                ExerciseItem(
                    title: 'Audio Transcript Analysis: Educational Lecture',
                    description:
                        'Analyze and understand the content of an educational lecture.',
                    color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AudioItem extends StatelessWidget {
  final String title;
  final String duration;
  final Color color;

  const AudioItem(
      {required this.title, required this.duration, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Duration: $duration',
          style: TextStyle(color: color.withOpacity(0.8))),
      onTap: () {
        // Agregar funcionalidad para reproducir el audio
      },
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const ExerciseItem(
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
        // Agregar funcionalidad para comenzar el ejercicio de escucha
      },
    );
  }
}
