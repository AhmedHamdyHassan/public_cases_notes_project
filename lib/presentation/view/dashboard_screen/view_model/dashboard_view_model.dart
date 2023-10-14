import 'package:case_app/models/case_model.dart';
import 'package:case_app/presentation/view/case_screen/view/case_screen.dart';
import 'package:case_app/presentation/view/case_screen/view_model/case_view_model.dart';
import 'package:case_app/presentation/view/create_case_screen/view/create_case_screen.dart';
import 'package:case_app/presentation/view/create_case_screen/view_model/create_case_view_model.dart';
import 'package:flutter/material.dart';

class DashboardViewModel {
  String filterKey = '';

  void navigateToCaseScreen(BuildContext context, CaseModel caseModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CaseScreen(
            caseViewModel: CaseViewModel(
              caseId: caseModel.id!,
              caseTitle: caseModel.caseName!,
            ),
          );
        },
      ),
    );
  }

  void navigateToCreateCaseScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CreateCaseScreen(
            createCaseViewModel: CreateCaseViewModel(),
          );
        },
      ),
    );
  }
}
