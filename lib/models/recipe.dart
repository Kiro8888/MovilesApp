class Recipe {
  final String name;
  final String images;
  final double rating;

  Recipe({this.name, this.images, this.rating});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] != null ? json['name'] as String : '',
      images:
          json['images'] != null && json['images'][0]['hostedLargeUrl'] != null
              ? json['images'][0]['hostedLargeUrl'] as String
              : '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
    );
  }

  static List<Recipe> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating}';
  }
}
