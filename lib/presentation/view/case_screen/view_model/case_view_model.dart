import 'package:case_app/models/case_model.dart';
import 'package:case_app/presentation/view/create_service_screen/view/create_service_screen.dart';
import 'package:case_app/presentation/view/create_service_screen/view_model/create_service_view_model.dart';
import 'package:case_app/presentation/view/dashboard_screen/view/dashboard_screen.dart';
import 'package:case_app/presentation/view/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:case_app/presentation/view/edit_case_screen/view/edit_case_screen.dart';
import 'package:case_app/presentation/view/edit_case_screen/view_model/edit_case_view_model.dart';
import 'package:case_app/presentation/view/upgrade_service_status_screen/view/upgrade_service_status_screen.dart';
import 'package:case_app/presentation/view/upgrade_service_status_screen/view_model/upgrade_service_status_view_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';

class CaseViewModel {
  final String caseId, caseTitle;
  late CaseModel caseModel;
  CaseViewModel({
    required this.caseId,
    required this.caseTitle,
  });

  Future<void> getCase() async {
    caseModel = await casesRipository.getCaseById(caseId);
  }

  void navigateToCreateCaseScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateServiceScreen(
          createServiceViewModel: CreateServiceViewModel(caseId: caseId),
        ),
      ),
    );
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          dashboardViewModel: DashboardViewModel(),
        ),
      ),
    );
  }

  void navigateToUpgradeStatusScreen(BuildContext context, int serviceNumber) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => UpgradeServiceStatusScreen(
          upgradeServiceStatusViewModel: UpgradeServiceStatusViewModel(
            caseModel: caseModel,
            serviceNumber: serviceNumber,
          ),
        ),
      ),
    );
  }

  void navigateToEditCaseScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EditCaseScreen(
          editCaseViewModel: EditCaseViewModel(caseModel: caseModel),
        ),
      ),
    );
  }

  Color? getColor(String status) {
    switch (status) {
      case "0":
        return null;
      case "1":
        return const Color(0xff207868);
      case "2":
        return Colors.red;
      case "3":
        return Colors.blue;
      default:
        return null;
    }
  }
}
