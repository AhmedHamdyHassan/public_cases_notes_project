import 'package:case_app/models/case_model.dart';
import 'package:case_app/presentation/view/dashboard_screen/view/dashboard_screen.dart';
import 'package:case_app/presentation/view/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';

class EditCaseViewModel {
  TextEditingController sacwisIdController = TextEditingController();
  TextEditingController caseNameController = TextEditingController();
  TextEditingController typeOfCaseController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  CaseModel caseModel;
  EditCaseViewModel({required this.caseModel}) {
    sacwisIdController.text = caseModel.sacwisId!;
    caseNameController.text = caseModel.caseName!;
    typeOfCaseController.text = caseModel.typeOfCase!;
    childNameController.text = caseModel.childName!;
  }

  Future<void> updateData(BuildContext context) async {
    caseModel.sacwisId = sacwisIdController.text;
    caseModel.caseName = caseNameController.text;
    caseModel.typeOfCase = typeOfCaseController.text;
    caseModel.childName = childNameController.text;
    await casesRipository.updateCase(caseModel);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          dashboardViewModel: DashboardViewModel(),
        ),
      ),
    );
  }
}
