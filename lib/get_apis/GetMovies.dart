import 'dart:convert';
import 'package:http/http.dart' as http;

class GetMovies {
  String title;
  String imgUrl;

  GetMovies._privateConstructor({required this.title, required this.imgUrl});

  factory GetMovies.createGetMovies(Map<String, dynamic> object) {
    return GetMovies._privateConstructor(
      title: object['Title'],
      imgUrl: object['Poster'],
    );
  }

  static Future<List<GetMovies>> getMovies(String title) async {
    Uri url = Uri.parse('http://www.omdbapi.com/?apikey=854e54f9&s=$title');
    http.Response apiResponse = await http.get(url);
    Map<String, dynamic> jsonObject = json.decode(apiResponse.body);
    List<dynamic> searchResults = jsonObject['Search'];

    List<GetMovies> results = [];

    searchResults.forEach((result) {
      results.add(GetMovies.createGetMovies(result));
    });

    return results;
  }
}