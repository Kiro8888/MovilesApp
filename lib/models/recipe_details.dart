class Recipe_details {
  final String id;
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String mobileSectionName;

  final List<String> preparationSteps;
  final List<String> ingredientLines;

  Recipe_details({
    this.id,
    this.name,
    this.images,
    this.rating,
    this.totalTime,
    this.preparationSteps,
    this.ingredientLines,
    this.mobileSectionName,
  });

  factory Recipe_details.fromJson(dynamic json) {
    List<String> preparationSteps = [];
    if (json['preparationSteps'] != null && json['preparationSteps'] is List) {
      preparationSteps = List<String>.from(json['preparationSteps']);
    }

    List<String> ingredientLines = [];
    if (json['ingredientLines'] != null && json['ingredientLines'] is List) {
      for (var line in json['ingredientLines']) {
        if (line['wholeLine'] != null) {
          ingredientLines.add(line['wholeLine']);
        }
      }
    }

    return Recipe_details(
      id: json['details']['id'] != null ? json['details']['id'] as String : '',
      name: json['details']['name'] != null
          ? json['details']['name'] as String
          : '',
      images: json['details']['images'] != null &&
              json['details']['images'][0]['hostedLargeUrl'] != null
          ? json['details']['images'][0]['hostedLargeUrl'] as String
          : '',
      rating: json['details']['rating'] != null
          ? json['details']['rating'].toDouble()
          : 0.0,
      totalTime: json['details']['totalTime'] != null
          ? json['details']['totalTime'] as String
          : '',
      preparationSteps: preparationSteps,
      ingredientLines: ingredientLines,
      mobileSectionName: json['nutrition']['mobileSectionName'] != null
          ? json['nutrition']['mobileSectionName'] as String
          : '',
    );
  }

  static List<Recipe_details> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) {
      return Recipe_details.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe_details {id: $id, name: $name, images: $images, rating: $rating, totalTime: $totalTime,}';
  }
}
