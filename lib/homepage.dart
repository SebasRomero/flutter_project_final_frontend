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
        color: const Color.fromARGB(255, 55, 57, 58), // Set the background color to gray
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
                    padding: EdgeInsets.all(10),
                    child: Icon(
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
                        CircleAvatar(
                          // User Icon
                          radius: 30,
                          // Add your user icon here
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi ${userAuth.username}!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 110,
                child: Container(
                  child: Text(
                    "You can improve every skill!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                top: 140, // Adjust the top position based on your design
                left: 0,
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildButton("Writing"),
                      _buildButton("Listening"),
                      _buildButton("Reading"),
                      _buildButton("Speaking"),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 380,
                child: Container(
                  child: Text(
                    "You can learn all of these tenses!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                top: 400, // Adjust the top position based on your design
                left: 0,
                child: Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      _buildVerticalButton("Past Simple"),
                      _buildVerticalButton("Past Continuous"),
                      _buildVerticalButton("Present Simple"),
                      _buildVerticalButton("Present Continuos"),
                      _buildVerticalButton("Present Perfect"),
                      _buildVerticalButton("Future Perfect"),
                      // Add more items as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 55, 57, 58),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 101, 0, 148),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('My tasks', style: TextStyle(color: Colors.white, fontSize: 20),),
              onTap: () {
                // Handle books option
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('My books', style: TextStyle(color: Colors.white, fontSize: 20),),
              onTap: () {
                // Handle books option
                Navigator.pushNamed(context, '/books'); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 101, 0, 148),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildVerticalButton(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 101, 0, 148),
        ),
        child: Container(
          height: 80, // Adjust the height as needed
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
