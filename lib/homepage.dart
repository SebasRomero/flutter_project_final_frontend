import 'package:flutter/material.dart';
import 'package:frontend_flutter/auth/context.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    UserAuthentication userAuth = Provider.of<UserAuthentication>(context);
    return Scaffold(
      body: Container(
        color: Colors.grey, // Set the background color to gray
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
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
                top: 100, // Adjust the top position based on your design
                left: 0,
                child: Container(
                  height: 100,
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
                top: 700, // Adjust the top position based on your design
                left: 0,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      _buildVerticalButton("Past Simple"),
                      _buildVerticalButton("Present Simple"),
                      _buildVerticalButton("Past Continuous"),
                      _buildVerticalButton("Present Simple"),
                      _buildVerticalButton("Present Simple"),
                      // Add more items as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(50, 10),
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
