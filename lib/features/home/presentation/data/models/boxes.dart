import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Firstpage> getQuestions() => Hive.box<Firstpage>('firstpages');
  static Box<Firstpage> getBoxofDays() => Hive.box<Firstpage>('daysboxes');

  void addDaysLocalData() async {
    final boxofday = Boxes.getBoxofDays();
    for (var i = 0; i < 7; i++) {
      boxofday.add(Firstpage());
    }
  }

  void checkExistingTableofday() async {
    await Hive.openBox<Firstpage>('daysboxes');
    final mybox = Boxes.getQuestions();
    Firstpage firestday = mybox.getAt(0);
    if (firestday == null) {
      addDaysLocalData();
    }
  }
}
