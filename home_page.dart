import 'package:app/singin_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AuthScreen()), // Navigate to the sign-in screen
            );
          },
        ),
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Image.network(
            "https://cdn.pixabay.com/photo/2023/11/14/20/08/woman-8388428_1280.jpg",
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Image.network(
            "https://cdn.pixabay.com/photo/2024/02/11/13/33/kumquats-8566508_640.jpg",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
