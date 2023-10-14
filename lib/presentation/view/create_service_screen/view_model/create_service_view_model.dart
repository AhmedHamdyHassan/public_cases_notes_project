import 'package:case_app/models/service_model.dart';
import 'package:case_app/presentation/view/case_screen/view/case_screen.dart';
import 'package:case_app/presentation/view/case_screen/view_model/case_view_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';

class CreateServiceViewModel {
  final String caseId;
  CreateServiceViewModel({required this.caseId});
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController partyController = TextEditingController();
  TextEditingController typeOfServiceController = TextEditingController();
  TextEditingController notificationTypeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  Future<void> navigateToCaseScreen(BuildContext context) async {
    ServiceModel serviceModel = ServiceModel(
      notes: notesController.text,
      notificationType: notificationTypeController.text,
      party: partyController.text,
      serviceName: serviceNameController.text,
      status: "0",
      typeOfService: typeOfServiceController.text,
    );
    await casesRipository.insertService(caseId, serviceModel);
    final caseModel = await casesRipository.getCaseById(caseId);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CaseScreen(
          caseViewModel:
              CaseViewModel(caseId: caseId, caseTitle: caseModel.caseName!),
        ),
      ),
    );
  }
}
