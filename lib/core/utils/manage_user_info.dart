import 'package:fapp/features/home/presentation/data/models/boxes.dart';

import '../../features/home/presentation/data/models/firstpage.dart';

class ManageUserInfo {
  static zerowingMacros() {
    DateTime currentDate = DateTime.now();
    final mybox = Boxes.getQuestions();
    Firstpage userInfoModel = mybox.get('key');
    int datesDiff =
        userInfoModel.initialzingDate.difference(currentDate).inHours;
    print("ahhaha" +
        datesDiff.toString() +
        "       userInfoModel.initialzingDate    :  " +
        userInfoModel.initialzingDate.toString());
    if (datesDiff >= 24) {
      userInfoModel
        ..carb = 0
        ..fat = 0
        ..prot = 0
        ..eating = 0
        ..initialzingDate = currentDate;
      // ..remaining = totalCal  we need to add total kal as well
      userInfoModel.save();
    }
  }
}
