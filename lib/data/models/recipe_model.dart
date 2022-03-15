class Recipe {
  late String label;
  late String image;
  late String source;
  late String url;
  late List<String> ingredients;
  late double calories;

  Recipe(this.label, this.image, this.source, this.url, this.ingredients,
      this.calories);

  Recipe.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    image = json['image'];
    source = json['source'];
    url = json['url'];
    ingredients =
        List<String>.from(json["ingredientLines"].map((item) => item));
    calories = json['calories'].toDouble();
  }
}
