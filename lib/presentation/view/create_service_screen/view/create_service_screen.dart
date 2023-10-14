import 'package:case_app/presentation/components/elevated_button_component.dart';
import 'package:case_app/presentation/components/text_field_component.dart';
import 'package:case_app/presentation/view/create_service_screen/view_model/create_service_view_model.dart';
import 'package:flutter/material.dart';

class CreateServiceScreen extends StatelessWidget {
  const CreateServiceScreen({
    super.key,
    required this.createServiceViewModel,
  });

  final CreateServiceViewModel createServiceViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: const Center(
                child: Text(
                  'Create Service',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            TextFieldComponent(
              controller: createServiceViewModel.serviceNameController,
              title: 'Service Name',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            TextFieldComponent(
              controller: createServiceViewModel.partyController,
              title: 'Party',
              hint: '',
              prefixIcon: const Icon(Icons.flag),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: createServiceViewModel.typeOfServiceController,
              title: 'Type of Service',
              prefixIcon: const Icon(Icons.flag),
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: createServiceViewModel.notificationTypeController,
              title: 'Notification Type',
              hint: '',
              prefixIcon: const Icon(Icons.flag),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            TextFieldComponent(
              controller: createServiceViewModel.notesController,
              title: 'Notes',
              hint: '',
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            ),
            const Spacer(),
            ElevatedButtonComponent(
              title: 'Create',
              onPress: () async =>
                  createServiceViewModel.navigateToCaseScreen(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ElevatedButtonComponent(
              title: 'Cancel',
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
