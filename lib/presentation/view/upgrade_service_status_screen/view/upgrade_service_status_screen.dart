import 'package:case_app/presentation/components/elevated_button_component.dart';
import 'package:case_app/presentation/components/text_field_component.dart';
import 'package:case_app/presentation/view/upgrade_service_status_screen/view_model/upgrade_service_status_view_model.dart';
import 'package:flutter/material.dart';

class UpgradeServiceStatusScreen extends StatefulWidget {
  const UpgradeServiceStatusScreen({
    super.key,
    required this.upgradeServiceStatusViewModel,
  });

  final UpgradeServiceStatusViewModel upgradeServiceStatusViewModel;

  @override
  State<UpgradeServiceStatusScreen> createState() =>
      _UpgradeServiceStatusScreenState();
}

class _UpgradeServiceStatusScreenState
    extends State<UpgradeServiceStatusScreen> {
  ScrollController listOfServicesScrollController = ScrollController();
  int selectedStatus = 0;

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
              child: Center(
                child: Text(
                  widget.upgradeServiceStatusViewModel.caseModel.caseName!,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            ElevatedButtonComponent(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              title: 'Prefected',
              onPress: () {
                setState(() {
                  selectedStatus = 1;
                });
                widget.upgradeServiceStatusViewModel.statusNumber = "1";
              },
              backgroundColor: const Color(0xff207868),
              foregroundColor: Colors.white,
              isSelected: selectedStatus == 1,
            ),
            ElevatedButtonComponent(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              title: 'Failed',
              onPress: () {
                setState(() {
                  selectedStatus = 2;
                });
                widget.upgradeServiceStatusViewModel.statusNumber = "2";
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              isSelected: selectedStatus == 2,
            ),
            ElevatedButtonComponent(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              title: 'Failed, Retried and Pending',
              onPress: () {
                setState(() {
                  selectedStatus = 3;
                });
                widget.upgradeServiceStatusViewModel.statusNumber = "3";
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              isSelected: selectedStatus == 3,
            ),
            TextFieldComponent(
              title: 'Notes',
              padding: const EdgeInsets.symmetric(horizontal: 20),
              controller: widget.upgradeServiceStatusViewModel.notesController,
            ),
            const Spacer(),
            //Create Case Button
            ElevatedButtonComponent(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              title: 'Update',
              onPress: () =>
                  widget.upgradeServiceStatusViewModel.upgradeStatus(context),
            ),
            ElevatedButtonComponent(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: 'Cancel',
              onPress: () => widget.upgradeServiceStatusViewModel
                  .upgradeStatus(context, isUpdated: false),
            ),
          ],
        ),
      ),
    );
  }
}
