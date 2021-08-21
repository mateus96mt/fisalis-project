import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          CircleAvatar(
            maxRadius: 200,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/fisalis-test-d0330.appspot.com/o/data%2Fshirt%2F1y.png?alt=media&token=5f5b73e5-d0a9-4288-b501-7a65e29542ce'),
          ),
          CircleAvatar(
            maxRadius: 200,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/fisalis-test-d0330.appspot.com/o/data%2Fshort%2F1b.png?alt=media&token=2286a4c4-5dbd-486e-a38b-7d26d10e1cdf'),
          ),
          CircleAvatar(
            maxRadius: 200,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/fisalis-test-d0330.appspot.com/o/data%2Fskirt%2F1b.png?alt=media&token=563c3ce0-8b2d-49c6-b6ce-2d1ad28e6096'),
          ),
        ],
      )),
    );
  }
}
