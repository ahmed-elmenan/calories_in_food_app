import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/features/supplements/domain/entities/protein_supplement.dart';
import 'package:meta/meta.dart';

class ProteinSupplementModel extends ProteinSupplement {
  static final collection = 'ProteinProducts';

  ProteinSupplementModel({
    @required String name,
    @required String id,
    @required String imageLink,
    @required String flavor,
    @required String ingredients,
    @required String description,
    @required String serving,
    @required double proteins,
    @required double carbs,
    @required double fat,
    @required double calories,
    @required double price,
    @required double rating,
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
          fat: fat,
          calories: calories,
          price: price,
          rating: rating,
        );

  factory ProteinSupplementModel.fromJson(DocumentSnapshot json) {
    return ProteinSupplementModel(
      name: json['name'],
      id: json['id'],
      imageLink: json['imageLink'],
      flavor: json['flavor'],
      ingredients: json['ingredients'],
      description: json['description'],
      serving: json['serving'],
      proteins: json['proteins'],
      carbs: json['carbs'],
      fat: json['fat'],
      calories: json['calories'],
      price: json['price'],
      rating: json['rating'],
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
      'fat': fat,
      'calories': calories,
      'price': price,
      'rating': rating,
    };
  }
}
