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

    MovieList alita =
        new MovieList("Alita", "xxxxx", "8/10", "assets/alita.jpeg");
    MovieList bubble =
        new MovieList("Bubble", "xxxxx", "10/10", "assets/bubble.jpeg");
    MovieList jujutsukaisen = new MovieList(
        "Jujutsukaisen", "xxxxx", "9/10", "assets/jujutsukaisen.jpeg");
    MovieList spiritedaway = new MovieList(
        "Spirited Away", "xxxxx", "9/10", "assets/spiritedaway.jpeg");
    MovieList whiskeraway = new MovieList(
        "Whisker Away", "xxxxx", "10/10", "assets/whiskeraway.jpeg");

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
        title: Text("Home Page"),
      ),
      body: Container(
        color: Colors.blueGrey, // Warna latar belakang
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: favouriteMovie?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Release Date: ${favouriteMovie![index].releaseDate}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rating: ${favouriteMovie![index].rating}",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
