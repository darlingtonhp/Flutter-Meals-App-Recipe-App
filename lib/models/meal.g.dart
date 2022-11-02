// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      duration: json['duration'] as int,
      complexity: $enumDecode(_$ComplexityEnumMap, json['complexity']),
      affordability: $enumDecode(_$AffordabilityEnumMap, json['affordability']),
      isGlutenFree: json['isGlutenFree'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'duration': instance.duration,
      'complexity': _$ComplexityEnumMap[instance.complexity]!,
      'affordability': _$AffordabilityEnumMap[instance.affordability]!,
      'isGlutenFree': instance.isGlutenFree,
      'isLactoseFree': instance.isLactoseFree,
      'isVegan': instance.isVegan,
      'isVegetarian': instance.isVegetarian,
    };

const _$ComplexityEnumMap = {
  Complexity.simple: 203,
  Complexity.challenging: 204,
  Complexity.hard: 205,
};

const _$AffordabilityEnumMap = {
  Affordability.affordable: 200,
  Affordability.pricey: 201,
  Affordability.luxurious: 202,
};
