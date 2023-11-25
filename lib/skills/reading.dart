import 'package:flutter/material.dart';

void main() {
  runApp(Reading());
}

class Reading extends StatelessWidget {
  const Reading({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Reading"),
          backgroundColor: const Color.fromARGB(255, 55, 57, 58),
          shadowColor: const Color.fromARGB(255, 55, 57, 58),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ReadingContain(),
      ),
    );
  }
}

class ReadingContain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;

    return Container(
      color: Color.fromARGB(255, 55, 57, 58),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 48, 50, 51),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Improve Your Reading Skills',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Enhance your reading comprehension with our diverse collection of articles and texts. Whether you are a beginner or an advanced reader, our materials cover a wide range of topics and difficulty levels.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Featured Articles',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ArticleItem(
                  title: 'The Art of Storytelling',
                  category: 'Literature',
                  color: Colors.purple),
              ArticleItem(
                  title: 'Exploring Scientific Discoveries',
                  category: 'Science',
                  color: Colors.purple),
              ArticleItem(
                  title: 'Current Events: A Global Perspective',
                  category: 'News',
                  color: Colors.purple),
              SizedBox(height: 40),
              Text(
                'Reading Exercises',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ExerciseItem(
                  title: 'Comprehension Quiz: Historical Figures',
                  description: 'Test your knowledge of historical figures.',
                  color: Colors.purple),
              ExerciseItem(
                  title: 'Vocabulary Builder: Technology Terms',
                  description: 'Expand your tech-related vocabulary.',
                  color: Colors.purple),
            ],
          ),
        ),
        )
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final String title;
  final String category;
  final Color color;

  const ArticleItem(
      {required this.title, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Category: $category',
          style: TextStyle(color: color.withOpacity(0.8))),
      onTap: () {},
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
      onTap: () {},
    );
  }
}
