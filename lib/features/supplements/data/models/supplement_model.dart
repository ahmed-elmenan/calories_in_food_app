import 'package:fapp/features/supplements/domain/entities/supplement.dart';
import 'package:meta/meta.dart';

class SupplementModel extends Supplement {
  SupplementModel({
    @required String name,
    @required String id,
    @required String imageLink,
    @required String flavor,
    @required String ingredients,
    @required String description,
    @required String serving,
    @required double proteins,
    @required double carbs,
    @required double price,
  }) : super(
          name: name,
          id: id,
          imageLink: imageLink,
          flavor: flavor,
          ingredients: ingredients,
          description: description,
          serving: serving,
          proteins: proteins,
          carbs: carbs,
          price: price,
        );

  factory SupplementModel.fromJson(Map<String, dynamic> json) {
    return SupplementModel(
      name: json['name'],
      id: json['id'],
      imageLink: json['imageLink'],
      flavor: json['flavor'],
      ingredients: json['ingredients'],
      description: json['description'],
      serving: json['serving'],
      proteins: json['proteins'],
      carbs: json['carbs'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'imageLink': imageLink,
      'flavor': flavor,
      'ingredients': ingredients,
      'description': description,
      'serving': serving,
      'proteins': proteins,
      'carbs': carbs,
      'price': price,
    };
  }
}
