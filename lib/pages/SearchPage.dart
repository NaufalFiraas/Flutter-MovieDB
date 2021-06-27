import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/MoviesContainer.dart';
import 'package:movie_db/get_apis/GetMovies.dart';
import 'package:movie_db/pages/LoginPage.dart';

class SearchPage extends StatefulWidget {
  final String username;
  const SearchPage({Key? key, required this.username}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState(username: this.username);
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Widget> moviesContainer = [];
  String username;

  _SearchPageState({required this.username});

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
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              this.username,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Pacifico',
                                  color: Colors.white),
                            ),
                            IconButton(
                              icon:
                                  Icon(Icons.exit_to_app, color: Colors.white),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: (this.searchController.text != '' &&
                                  this.moviesContainer.isEmpty)
                              ? [
                                  MoviesContainer(
                                      imgUrl:
                                          'https://miro.medium.com/max/880/0*H3jZONKqRuAAeHnG.jpg',
                                      title: '',
                                      buttonText: '')
                                ]
                              : this.moviesContainer,
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
        this.moviesContainer.add(
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
