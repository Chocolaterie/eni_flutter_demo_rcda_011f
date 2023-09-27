import 'package:eni_flutter_demo/demo_api/movie.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';

// Le lancer
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
  // Liste de films
  List<Movie> movies = [];
  ProgressDialog? pd;

  /**
   * Ouvrir la boite de dialogue
   */
  void showProgress(){
    // instancier la boite de dialogue
    pd = ProgressDialog(context: context);

    // afficher
    pd!.show(
      msg: "Chargement des données en cours",
      barrierColor: Color(0x55000000)
    );
  }

  /**
   * Fermer la boite de dialogue
   */
  void closeProgress(){
    pd!.close();
  }

  void callApi() async {
    // Affiche le chargement
    showProgress();

    // Vider la liste
    setState(() {
      movies = [];
    });

    // simuler 2 sec d'attente
    await Future.delayed(Duration(seconds:  2));

    // Je récupère le point d'entrée de l'api
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movies.json"));

    // Je convertis la réponse http en json
    var json = convert.jsonDecode(response.body);

    // Je convertis le json en objet Movie
    movies = List<Movie>.from(json.map((movieJson) => Movie.jsonToMovie(movieJson)));

    // J'affiche movie (rafraichir la vue)
    setState(() {});

    // Fermer la boite de dialogue à la fin du processus/de la tâche
    closeProgress();
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
            ElevatedButton(
              onPressed: () {
                callApi();
              },
              child: Text("Appeler Api"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Faire la vue d'une cellule
                    return Container(color: Colors.black12, child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Le film : ${movies[index].title}"),
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
