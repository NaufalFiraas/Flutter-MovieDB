import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/RowDetails.dart';
import 'package:movie_db/get_apis/GetMovieDetails.dart';


class DetailsPage extends StatefulWidget {
  final String title;
  final String imgUrl;

  const DetailsPage({ Key? key, required this.title, required this.imgUrl }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(title: this.title, imgUrl: this.imgUrl);
}

class _DetailsPageState extends State<DetailsPage> {
  String title;
  String year;
  String genre;
  String writer;
  String plot;
  String imgUrl;

  _DetailsPageState({required this.title, required this.imgUrl, this.year = '...', this.genre = '...', this.writer = '...', this.plot = '...'}) {
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.purple],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.8,
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
                  offset: Offset(2,3),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(this.imgUrl),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: ListView(
                      children: [
                        RowDetails(parameter: 'Title   : ', value: this.title),
                        SizedBox(height: 5),
                        RowDetails(parameter: 'Year   : ', value: this.year),
                        SizedBox(height: 5),
                        RowDetails(parameter: 'Genre: ', value: this.genre),
                        SizedBox(height: 5),
                        RowDetails(parameter: 'Writer: ', value: this.writer),
                        SizedBox(height: 5),
                        RowDetails(parameter: 'Plot    : ', value: this.plot),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getDetails() async {
    await GetMovieDetails.getMovieDetails(this.title).then((value) {
      this.year = value.year;
      this.genre = value.genre;
      this.writer = value.writer;
      this.plot = value.plot;
    });
    setState(() {});
  }
}