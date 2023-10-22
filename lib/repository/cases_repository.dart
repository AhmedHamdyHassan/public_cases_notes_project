import 'package:case_app/models/case_model.dart';
import 'package:case_app/models/service_model.dart';
import 'package:firebase_database/firebase_database.dart';

CasesRipository casesRipository = CasesRipository();

class CasesRipository {
  late DatabaseReference databaseReference;
  final String databaseCollectionName = 'cases';
  late Query query;
  final String databaseUrl =
      'https://public-cases-project-default-rtdb.europe-west1.firebasedatabase.app';
  CasesRipository() {
    FirebaseDatabase.instance.databaseURL = databaseUrl;
    databaseReference = FirebaseDatabase.instance.ref().child(
          databaseCollectionName,
        );
    query = FirebaseDatabase.instance.ref().child(databaseCollectionName);
  }

  Future<void> insertCase(CaseModel caseModel) async {
    try {
      await databaseReference.push().set(caseModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insertService(String caseId, ServiceModel service) async {
    final CaseModel caseModel = await getCaseById(caseId);
    caseModel.services!.add(service);
    await databaseReference.child(caseId).update(caseModel.toJson());
  }

  Future<void> updateCase(CaseModel caseModel) async {
    await databaseReference.child(caseModel.id!).update(caseModel.toJson());
  }

  Future<void> deleteCase(CaseModel caseModel) async {
    await databaseReference.child(caseModel.id!).remove();
  }

  CaseModel getCase(Map data, String key) {
    final caseModel = CaseModel.fromJson(
      data.cast<String, dynamic>(),
    );
    caseModel.id = key;
    return caseModel;
  }

  Future<CaseModel> getCaseById(String id) async {
    final response = await databaseReference.child(id).once();
    return getCase((response.snapshot.value as Map), response.snapshot.key!);
  }
}
