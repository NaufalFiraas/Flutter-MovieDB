import 'package:flutter/material.dart';

class RowDetails extends StatelessWidget {
  final String parameter;
  final String value;

  const RowDetails({Key? key, required this.parameter, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.parameter,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            this.value,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
