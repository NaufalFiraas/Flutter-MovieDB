import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool obscure;

  const Textfields({Key? key, required this.label, required this.controller, required this.icon, required this.obscure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: this.label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Pacifico',
        ),
        icon: Icon(
          this.icon,
          color: Colors.white,
        ),
      ),
      controller: this.controller,
      obscureText: this.obscure,
    );
  }
}
