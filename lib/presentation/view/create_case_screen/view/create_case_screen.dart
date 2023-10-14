import 'package:case_app/presentation/components/elevated_button_component.dart';
import 'package:case_app/presentation/components/text_field_component.dart';
import 'package:case_app/presentation/view/create_case_screen/view_model/create_case_view_model.dart';
import 'package:case_app/presentation/view/dashboard_screen/view/dashboard_screen.dart';
import 'package:case_app/presentation/view/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';

class CreateCaseScreen extends StatelessWidget {
  const CreateCaseScreen({
    super.key,
    required this.createCaseViewModel,
  });

  final CreateCaseViewModel createCaseViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: const Center(
                child: Text(
                  'Create Case',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            TextFieldComponent(
              controller: createCaseViewModel.caseNameMomController,
              title: 'Case Name (Mom)',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            TextFieldComponent(
              controller: createCaseViewModel.childNameController,
              title: 'Child\'s Name',
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: createCaseViewModel.sACWSIDController,
              title: 'SACWS ID',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: createCaseViewModel.typeOfCaseController,
              title: 'Type of case (Active, VPS, etc)',
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            const Spacer(),
            ElevatedButtonComponent(
              title: 'Create',
              onPress: () async =>
                  await createCaseViewModel.createCase(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ElevatedButtonComponent(
              title: 'Cancel',
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(
                      dashboardViewModel: DashboardViewModel(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
