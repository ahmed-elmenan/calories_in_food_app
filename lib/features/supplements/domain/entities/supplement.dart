import 'package:meta/meta.dart';

class Supplement {
  final String name;
  final String id;
  final String imageLink;
  final String flavor;
  final String ingredients;
  final String description;
  final String serving; // scoop
  final double proteins;
  final double carbs;
  final double price;

  Supplement({@required this.name, @required this.id, @required this.imageLink, @required this.flavor, @required this.ingredients, @required this.description, @required this.serving, @required this.proteins, @required this.carbs, @required this.price});

}
