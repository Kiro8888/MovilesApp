class Recipe_details {
  final String id;
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List<String> keywords;

  Recipe_details({
    this.id,
    this.name,
    this.images,
    this.rating,
    this.totalTime,
    this.keywords,
  });

  factory Recipe_details.fromJson(dynamic json) {
    List<String> keywordList = [];
    if (json['keywords'] != null && json['keywords'] is List) {
      keywordList = List<String>.from(json['keywords']);
    }

    return Recipe_details(
      id: json['id'] != null ? json['id'] as String : '',
      name: json['name'] != null ? json['name'] as String : '',
      images:
          json['images'] != null && json['images'][0]['hostedLargeUrl'] != null
              ? json['images'][0]['hostedLargeUrl'] as String
              : '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      totalTime: json['totalTime'] != null ? json['totalTime'] as String : '',
      keywords: keywordList,
    );
  }

  static List<Recipe_details> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) {
      return Recipe_details.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe_details {id: $id, name: $name, images: $images, rating: $rating, totalTime: $totalTime, keywords: $keywords}';
  }
}
