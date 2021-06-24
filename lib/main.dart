import 'package:flutter/material.dart';
import 'pages/MainPage.dart';


void main() {
  runApp(MovieDB());
}

class MovieDB extends StatelessWidget {
  const MovieDB({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}