import 'package:meta/meta.dart';

class ProteinSupplement {
  final String name;
  final String id;
  final String imageLink;
  final String flavor;
  final String ingredients;
  final String description;
  final String serving;
  final double proteins;
  final double carbs;
  final double fat;
  final double calories;
  final double price;
  final double rating;

  ProteinSupplement({@required this.calories, @required this.fat, @required this.rating, @required this.name, @required this.id, @required this.imageLink, @required this.flavor, @required this.ingredients, @required this.description, @required this.serving, @required this.proteins, @required this.carbs, @required this.price});

}
