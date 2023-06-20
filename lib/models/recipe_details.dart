class Recipe_details {
  final String id;
  final String name;
  final String images;
  final double rating;

  Recipe_details({this.id, this.name, this.images, this.rating});

  factory Recipe_details.fromJson(dynamic json) {
    return Recipe_details(
      id: json['id'] != null ? json['id'] as String : '',
      name: json['name'] != null ? json['name'] as String : '',
      images:
          json['images'] != null && json['images'][0]['hostedLargeUrl'] != null
              ? json['images'][0]['hostedLargeUrl'] as String
              : '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
    );
  }

  static List<Recipe_details> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) {
      return Recipe_details.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {id: $id, name: $name, image: $images, rating: $rating}';
  }
}
