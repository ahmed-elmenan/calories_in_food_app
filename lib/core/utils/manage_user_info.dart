import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import '../../features/home/presentation/data/models/firstpage.dart';

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
        ..remining = userInfoModel.totalCal
        ..initialzingDate =
            userInfoModel.initialzingDate.add(Duration(hours: 24));
      userInfoModel.save();
    }
  }
}
