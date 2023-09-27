class Movie {
  int id;
  String title;
  String description;

  Movie(this.id, this.title, this.description);

  /**
   * Fonction utilitaire permettant de convertir des données json en objet Movie
   */
  static Movie jsonToMovie(Map<String, dynamic> json){
    return Movie(json['id'], json['title'], json['description']);
  }
}