import 'package:flutter/material.dart';
import 'package:myapp/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieList>? favouriteMovie = [];

  @override
  void initState() {
    super.initState();

    MovieList alita = new MovieList(
        "Alita: Battle Angel", "2019", "9/10", "assets/alita.jpeg");
    MovieList bubble =
        new MovieList("Bubble", "2022", "10/10", "assets/bubble.jpeg");
    MovieList jujutsukaisen = new MovieList(
        "Jujutsukaisen", "2022", "9/10", "assets/jujutsukaisen.jpeg");
    MovieList spiritedaway = new MovieList(
        "Spirited Away", "2001", "10/10", "assets/spiritedaway.jpeg");
    MovieList whiskeraway = new MovieList(
        "Whisker Away", "2020", "8/10", "assets/whiskeraway.jpeg");

    favouriteMovie?.add(alita);
    favouriteMovie?.add(bubble);
    favouriteMovie?.add(jujutsukaisen);
    favouriteMovie?.add(spiritedaway);
    favouriteMovie?.add(whiskeraway);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 6, 149, 192), Color(0xFF3949AB)],
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: favouriteMovie?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(favouriteMovie![index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            favouriteMovie![index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Release Date: ${favouriteMovie![index].releaseDate}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rating: ${favouriteMovie![index].rating}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
