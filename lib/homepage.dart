import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserAuthentication userAuth = Provider.of<UserAuthentication>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: const Color.fromARGB(
            255, 55, 57, 58), // Set the background color to gray
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0, // Adjust the right position based on your design
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi ${userAuth.username}!',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130,
                child: Container(
                  child: const Text(
                    "You can improve every skill!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                top: 170, // Adjust the top position based on your design
                left: 0,
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: _buildButton("Writing", '/writing')),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: _buildButton("Reading", '/reading')),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: _buildButton("Speaking", '/speaking')),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: _buildButton("Listening", '/listening')),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  child: const Text(
                    "You can learn all of these tenses!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                top: 340, // Adjust the top position based on your design
                left: 0,
                child: SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      _buttonEdited('Past Simple', '../assets/happy_woman.png',
                          '/past_simple'),
                      _buttonEdited('Past Continuos',
                          '../assets/girl_reading.jpg', '/past_continuos'),
                      _buttonEdited('Past Perfect', '../assets/green.jpeg',
                          '/past_perfect'),
                      _buttonEdited('Present Simple', '../assets/guy_dog.jpg',
                          '/present_simple'),
                      _buttonEdited('Present Continuos', '../assets/home.jpeg',
                          '/present_continuos'),
                      _buttonEdited('Present perfect', '../assets/bus.jpeg',
                          '/present_perfect'),
                      _buttonEdited('Future simple', '../assets/threek.jpeg',
                          '/future_simple')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: 
      Drawer(
  backgroundColor: const Color.fromARGB(255, 55, 57, 58),
  child: Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 157, 44, 209),
              ),
              child: Text(
                'My section',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'My tasks',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/tasks');
              },
            ),
            ListTile(
              title: const Text(
                'My books',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/books');
              },
            ),
          ],
        ),
      ),
      // Log Out button at the bottom
      ListTile(
        title: const Text(
          'Log Out',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onTap: () {
          // Perform log out logic here
          // Example: Clear authentication token, user data, etc.

          // Navigate to the "/" route and remove context
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
    ],
  ),
),
    );
  }

  Widget _buttonEdited(String text, String src, String route) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: ImageBackgroundButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          image: AssetImage(src),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ));
  }

  Widget _buildButton(String text, String toGo) {
    return SizedBox(
      width: 130,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, toGo);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Clear the background color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(
              vertical: 0), // Adjust padding as needed
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust border radius as needed
          ),
          elevation: 0, // Remove the button elevation
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black
                .withOpacity(0.9), // Match the button's border radius
            image: DecorationImage(
              image: const AssetImage(
                  '../assets/sky.jpeg'), // Replace with your image path
              fit: BoxFit.fill, // Adjust the BoxFit property as needed
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageBackgroundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider<Object> image;
  final Widget child;

  const ImageBackgroundButton({
    required this.onPressed,
    required this.image,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          child: Container(
            height: 90,
            color: Colors.black.withOpacity(0.7),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
