import 'package:flutter/material.dart';
import 'package:movie_db/pages/DetailsPage.dart';
import 'Buttons.dart';


class MoviesContainer extends StatelessWidget {
  final String imgUrl;
  final String title;
  final double marginRight;
  final String buttonText;

  const MoviesContainer(
      {Key? key,
      required this.imgUrl,
      required this.title,
      this.marginRight = 0,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.67,
      margin: EdgeInsets.only(
        left: 28,
        right: this.marginRight,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(2, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black26,
                  offset: Offset(2, 3),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: NetworkImage(this.imgUrl),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsPage(
                      title: this.title,
                      imgUrl: this.imgUrl,
                    );
                  }));
                },
                child: Buttons(
                  width: 120,
                  height: 30,
                  text: this.buttonText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
