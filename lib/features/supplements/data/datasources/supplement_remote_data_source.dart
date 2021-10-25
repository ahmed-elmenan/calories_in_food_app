import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/core/error/exceptions.dart';
import 'package:fapp/features/supplements/data/models/protein_supplement_model.dart';
import 'package:meta/meta.dart';

abstract class SupplementRemoteDataSource {
  Future<ProteinSupplementModel> getProteinSupplement(String productName);
}

class SupplementRemoteDataSourceImpl implements SupplementRemoteDataSource {
  final FirebaseFirestore firestore;

  SupplementRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ProteinSupplementModel> getProteinSupplement(
      String productName) async {
    ProteinSupplementModel model;
    try {
      await firestore
          .collection(ProteinSupplementModel.collection)
          .where("name", isEqualTo: productName)
          .get()
          .then((doc) {
        doc.docs.forEach((DocumentSnapshot doc) {
          model = new ProteinSupplementModel.fromSnapshot(doc);
        });
      });
    } catch (e) {
      print(e.toString());
    }
    return model;
  }
}
