import 'package:eni_flutter_demo/demo_api/movie.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Le lanceru
void main() {
  runApp(DemoMovieApi());
}

// L'application
class DemoMovieApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Movie Api",
      home: MovieApiPage(),
    );
  }
}

// Et la page
class MovieApiPage extends StatefulWidget {

  @override
  State<MovieApiPage> createState() => _MovieApiPageState();
}

class _MovieApiPageState extends State<MovieApiPage> {
  // Movie nullable
  Movie? movie;

  void callApi() async {
    // Je récupère le point d'entrée de l'api
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movie.json"));

    // Je convertis la réponse http en json
    var json = convert.jsonDecode(response.body);

    // Je convertis le json en objet Movie
    movie = Movie.jsonToMovie(json);

    // J'affiche movie (rafraichir la vue)
    setState(() {});

    // print("Le film id: ${movie.id} se nomme : ${movie.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Movie Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text("Le film : ${movie?.title}"),
            ),
            ElevatedButton(
              onPressed: () {
                callApi();
              },
              child: Text("Appeler Api"),
            ),
          ],
        ),
      ),
    );
  }
}
