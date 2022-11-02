import 'package:json_annotation/json_annotation.dart';
part 'meal.g.dart';

enum Complexity {
  @JsonValue(203)
  simple,
  @JsonValue(204)
  challenging,
  @JsonValue(205)
  hard,
}

enum Affordability {
  @JsonValue(200)
  affordable,
  @JsonValue(201)
  pricey,
  @JsonValue(202)
  luxurious,
}

@JsonSerializable()
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  toMap() {}

  static fromMap(Map<String, dynamic> x) {}

  // static fromMap(Map<String, dynamic> x) {}

  // toMap() {}
  // factory Meal.fromJson(Map<String, dynamic> json) => Meal(
  //       id: json['id'],
  //       categories: json['categories'],
  //       title: json['title'],
  //       imageUrl: json['imageUrl'],
  //       ingredients: json['ingredients'],
  //       steps: json['steps'],
  //       duration: json['duration'],
  //       complexity: json['complexity'],
  //       affordability: json['afforadability'],
  //       isGlutenFree: json['isGlutenFree'],
  //       isLactoseFree: json['isLactoseFree'],
  //       isVegan: json['isVegan'],
  //       isVegetarian: json['isVegetarian'],
  //     );

  // static Map<String, dynamic> toJson(Meal value) => {
  //       'id': value.id,
  //       'categories': value.categories,
  //       'title': value.title,
  //       'imageUrl': value.imageUrl,
  //       'ingredients': value.ingredients,
  //       'steps': value.steps,
  //       'duration': value.duration,
  //       'complexity': value.complexity,
  //       'affordabilty': value.affordability,
  //       'isGlutenFree': value.isGlutenFree,
  //       'isLactoseFree': value.isLactoseFree,
  //       'isVegan': value.isVegan,
  //       'isVegetarian': value.isVegetarian,
  //     };

  // static Map<String, dynamic> toMap(Meal meal) => {
  //       'id': meal.id,
  //       'categories': meal.categories,
  //       'title': meal.title,
  //       'imageUrl': meal.id,
  //       'ingredients': meal.ingredients,
  //       'steps': meal.steps,
  //       'duration': meal.duration,
  //       'complexity': meal.complexity,
  //       'affordability': meal.affordability,
  //       'isGlutenFree': meal.isGlutenFree,
  //       'isLactoseFree': meal.isLactoseFree,
  //       'isVegan': meal.isVegan,
  //       'isVegetarian': meal.isVegetarian,
  //     };
  // static String encode(List<Meal> favouriteMeals) => json.encode(
  //       favouriteMeals
  //           .map<Map<String, dynamic>>(
  //               (favouriteMeals) => Meal.toMap(favouriteMeals))
  //           .toList(),
  //     );

  // static List<Meal> decode(String favouriteMeals) =>
  //     (json.decode(favouriteMeals) as List<dynamic>)
  //         .map<Meal>((e) => Meal.fromJson(e))
  //         .toList();
}
