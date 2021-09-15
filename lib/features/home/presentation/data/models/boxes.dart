import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Firstpage> getQuestions() => Hive.box<Firstpage>('firstpages');

}
