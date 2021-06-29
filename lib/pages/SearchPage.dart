import 'package:flutter/material.dart';
import 'package:movie_db/custom_widgets/MoviesContainer.dart';
import 'package:movie_db/pages/LoginPage.dart';
import 'package:movie_db/shared_states/Results.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final String username;

  SearchPage({required this.username});

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
            ChangeNotifierProvider(
              create: (context) => Results(),
              child: Container(
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
                                icon: Icon(Icons.exit_to_app,
                                    color: Colors.white),
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
                          child: Consumer<Results>(
                            builder: (context, results, _) => TextField(
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                labelText: 'Search',
                                labelStyle: TextStyle(
                                  fontFamily: 'Pacifico',
                                  color: Colors.purple,
                                ),
                                icon: Icon(Icons.search, color: Colors.purple),
                              ),
                              controller: this.searchController,
                              onChanged: (value) {
                                results.searchController = this.searchController;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Consumer<Results>(
                            builder: (context, results, _) => Row(
                              children: (this.searchController.text != '' &&
                                      results.moviesContainer.isEmpty)
                                  ? [
                                      MoviesContainer(
                                          imgUrl:
                                              'https://miro.medium.com/max/880/0*H3jZONKqRuAAeHnG.jpg',
                                          title: '',
                                          buttonText: '')
                                    ]
                                  : results.moviesContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
