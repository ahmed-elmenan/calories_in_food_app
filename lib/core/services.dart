import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static String collection = "OnHoldAds";
  static FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future addAdId(Map<String, dynamic> values) async {
    try {
      await _fireStore.collection(collection).doc(values["id"]).set(values);
    } catch (e) {
      print("create user service error = " + e.toString());
    }
  }
}