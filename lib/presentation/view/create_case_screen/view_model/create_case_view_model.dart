import 'package:case_app/models/case_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';

class CreateCaseViewModel {
  TextEditingController caseNameMomController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  TextEditingController sACWSIDController = TextEditingController();
  TextEditingController typeOfCaseController = TextEditingController();

  Future<void> createCase(BuildContext context) async {
    CaseModel caseModel = CaseModel(
      caseName: caseNameMomController.text,
      childName: childNameController.text,
      sacwisId: sACWSIDController.text,
      services: [],
      typeOfCase: typeOfCaseController.text,
    );
    await casesRipository.insertCase(caseModel);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
