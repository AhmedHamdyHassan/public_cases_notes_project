import 'package:case_app/presentation/components/elevated_button_component.dart';
import 'package:case_app/presentation/components/outlined_button_component.dart';
import 'package:case_app/presentation/components/text_field_component.dart';
import 'package:case_app/presentation/view/edit_case_screen/view_model/edit_case_view_model.dart';
import 'package:flutter/material.dart';

class EditCaseScreen extends StatelessWidget {
  const EditCaseScreen({super.key, required this.editCaseViewModel});

  final EditCaseViewModel editCaseViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: Text(editCaseViewModel.caseModel.caseName!),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldComponent(
              controller: editCaseViewModel.sacwisIdController,
              title: 'SACWS ID',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            TextFieldComponent(
              controller: editCaseViewModel.caseNameController,
              title: 'Case Name (Mom)',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            TextFieldComponent(
              controller: editCaseViewModel.typeOfCaseController,
              title: 'Type of case (Active, VPS, etc)',
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: editCaseViewModel.childNameController,
              title: 'Notes',
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            const Spacer(),
            ElevatedButtonComponent(
              backgroundColor: Colors.orange,
              title: 'Update',
              onPress: () async => await editCaseViewModel.updateData(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            OutlinedButtonComponent(
              title: 'Back',
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
