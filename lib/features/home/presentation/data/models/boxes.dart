import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Firstpage> getQuestions() => Hive.box<Firstpage>('firstpages');
  static Box<Firstpage> getBoxofDays() => Hive.box<Firstpage>('daysboxes');

  static void addDaysLocalData() async {
    final boxofday = Boxes.getBoxofDays();
    for (var i = 0; i < 7; i++) {
      Firstpage firstpage = Firstpage.init(0.0, 0.0, 0.0, 0.0, 0.0);
      await boxofday.put(i, firstpage);
    }
  }
}
