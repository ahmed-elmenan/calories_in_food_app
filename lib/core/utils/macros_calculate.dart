import 'package:fapp/features/home/presentation/data/models/boxes.dart';

class MacrosCalcul {
  static double calacRemaining(dynamic quetion) {
    double bmr = 0;
    double Remaining = 0;
    final mybox = Boxes.getQuestions();
    final quetion = mybox.get('key');
    if (quetion.Gender == 1)
      bmr = quetion.isWomen(quetion.Age, quetion.Length, quetion.Weight);
    else if (quetion.Gender == 2)
      bmr = quetion.is_Man(quetion.Age, quetion.Length, quetion.Weight);
    if (quetion.typeExercise == 1)
      Remaining = quetion.notExercise(bmr);
    else if (quetion.typeExercise == 2)
      Remaining = quetion.lightExercise(bmr);
    else if (quetion.typeExercise == 3)
      Remaining = quetion.notExercise(bmr);
    else if (quetion.typeExercise == 4)
      Remaining = quetion.moderateExercise(bmr);
    else if (quetion.typeExercise == 5) Remaining = quetion.extraActive(bmr);
    return Remaining;
  }
}