import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/widgets/card_details.dart';
import '../../features/home/presentation/data/models/firstpage.dart';
import 'package:fapp/core/utils/macros_calculate.dart';

class ManageUserInfo {
  static zerowingMacros() {
    DateTime currentDate = DateTime.now();
    final mybox = Boxes.getQuestions();
    Firstpage userInfoModel = mybox.get('key');
    int timeDiff = currentDate.compareTo(userInfoModel.initialzingDate);
    if (timeDiff >= 0) {
      userInfoModel
        ..carb = 0
        ..fat = 0
        ..prot = 0
        ..eating = 0
        ..remining = 0 //MacrosCalcul.calacRemaining(userInfoModel)
        ..initialzingDate =
            userInfoModel.initialzingDate.add(Duration(hours: 24));
      userInfoModel.save();
      Card_details.calories = 0.0;
      Card_details.carb = 0.0;
      Card_details.proteins = 0.0;
      Card_details.calories = 0.0;
    }
  }
}

// 3454