// ignore_for_file: use_build_context_synchronously

import 'package:case_app/models/case_model.dart';
import 'package:case_app/presentation/view/case_screen/view/case_screen.dart';
import 'package:case_app/presentation/view/case_screen/view_model/case_view_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';

class UpgradeServiceStatusViewModel {
  CaseModel caseModel;
  int serviceNumber;
  String statusNumber = "0";
  TextEditingController notesController = TextEditingController();
  UpgradeServiceStatusViewModel({
    required this.caseModel,
    required this.serviceNumber,
  }) {
    notesController.text = caseModel.services![serviceNumber].notes!;
  }

  Future<void> upgradeStatus(BuildContext context,
      {bool isUpdated = true}) async {
    if (isUpdated) {
      caseModel.services![serviceNumber].status = statusNumber;
      caseModel.services![serviceNumber].notes = notesController.text;
      await casesRipository.updateCase(caseModel);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CaseScreen(
          caseViewModel: CaseViewModel(
            caseId: caseModel.id!,
            caseTitle: caseModel.caseName!,
          ),
        ),
      ),
    );
  }
}
