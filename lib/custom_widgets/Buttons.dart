import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const Buttons({Key? key, required this.width, required this.height, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurpleAccent, Colors.purple],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(2, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
