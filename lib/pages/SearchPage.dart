import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/MoviesContainer.dart';
import 'package:movie_db/get_apis/GetMovies.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Widget> moviesContainer = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
              child: Align(
                alignment: Alignment(0, 0.5),
                child: Image(
                  image: AssetImage('images/search.png'),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(2, 3),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        labelText: 'Search',
                        labelStyle: TextStyle(
                          fontFamily: 'Pacifico',
                          color: Colors.purple,
                        ),
                        icon: Icon(Icons.search, color: Colors.purple),
                      ),
                      controller: this.searchController,
                      onChanged: (value) {
                        addMovies();
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: this.moviesContainer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addMovies() async {
    this.moviesContainer = [];
    await GetMovies.getMovies(this.searchController.text).then((values) {
      for (int i = 0; i < values.length; i++) {
        this.moviesContainer.add((i == values.length - 1)
            ? MoviesContainer(
                imgUrl: values[i].imgUrl,
                title: values[i].title,
                buttonText: 'Details',
                marginRight: 28,
              )
            : MoviesContainer(
                imgUrl: values[i].imgUrl,
                title: values[i].title,
                buttonText: 'Details',
              ));
      }
    });
  }
}
