import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/Buttons.dart';
import 'SearchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.purple],
              ),
            ),
            child: Center(
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(125),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(125),
                  child: Image(
                    image: AssetImage('images/home_cinema.png'),
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              'MovieDB',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Pacifico',
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black26,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              child: Buttons(height: 60, width: 180, text: 'Masuk',),
            ),
          ),
        ],
      ),
    );
  }
}
