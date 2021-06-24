import 'dart:convert';
import 'package:http/http.dart' as http;

class GetMovieDetails {
  String title;
  String year;
  String genre;
  String writer;
  String plot;

  GetMovieDetails._privateConstructor({required this.title, required this.year, required this.genre, required this.writer, required this.plot});

  factory GetMovieDetails.createMovies(Map<String, dynamic> object) {
    return GetMovieDetails._privateConstructor(
      title: object['Title'],
      year: object['Year'],
      genre: object['Genre'],
      writer: object['Writer'],
      plot: object['Plot'],
    );
  }

  static Future<GetMovieDetails> getMovieDetails(String title) async {
    Uri url = Uri.parse('http://www.omdbapi.com/?apikey=854e54f9&t=$title');
    http.Response detailsResult = await http.get(url);
    Map<String, dynamic> jsonObject = json.decode(detailsResult.body);

    return GetMovieDetails.createMovies(jsonObject);
  }
}