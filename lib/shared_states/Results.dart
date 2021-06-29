import 'package:flutter/widgets.dart';
import 'package:movie_db/custom_widgets/MoviesContainer.dart';
import 'package:movie_db/get_apis/GetMovies.dart';

class Results with ChangeNotifier {
  TextEditingController _searchController = TextEditingController();
  List<Widget> _moviesContainer = [];

  set searchController(TextEditingController searchController) {
    this._searchController = searchController;
    addMovies();
    notifyListeners();
  }

  List<Widget> get moviesContainer => this._moviesContainer;

  Future<void> addMovies() async {
    this._moviesContainer = [];
    await GetMovies.getMovies(this._searchController.text).then((values) {
      for (int i = 0; i < values.length; i++) {
        this._moviesContainer.add(
              (values[i].imgUrl == 'N/A')
                  ? MoviesContainer(
                      imgUrl:
                          'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png',
                      title: values[i].title,
                      buttonText: 'Details')
                  : (i == values.length - 1)
                      ? MoviesContainer(
                          imgUrl: values[i].imgUrl,
                          title: values[i].title,
                          buttonText: 'Details',
                          marginRight: 28,
                        )
                      : MoviesContainer(
                          imgUrl: values[i].imgUrl,
                          title: values[i].title,
                          buttonText: 'Details'),
            );
      }
    });
  }
}