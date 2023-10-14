import 'package:case_app/models/service_model.dart';
import 'package:case_app/presentation/components/outlined_button_component.dart';
import 'package:case_app/presentation/view/case_screen/view_model/case_view_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CaseScreen extends StatefulWidget {
  const CaseScreen({
    super.key,
    required this.caseViewModel,
  });

  final CaseViewModel caseViewModel;

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    widget.caseViewModel.getCase().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: Text(widget.caseViewModel.caseTitle),
        actions: [
          IconButton(
            onPressed: () =>
                widget.caseViewModel.navigateToEditCaseScreen(context),
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //List of Services
            if (isLoading == false)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FirebaseAnimatedList(
                    query: FirebaseDatabase.instance
                        .ref()
                        .child('cases/${widget.caseViewModel.caseId}/services'),
                    itemBuilder: (context, snapshot, animation, index) {
                      final ServiceModel serviceModel = ServiceModel.fromJson(
                        (snapshot.value as Map).cast<String, dynamic>(),
                      );
                      return GestureDetector(
                        onTap: () => widget.caseViewModel
                            .navigateToUpgradeStatusScreen(context, index),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                          child: Card(
                            color: widget.caseViewModel
                                .getColor(serviceModel.status!),
                            child: Center(
                              child: Text(
                                serviceModel.serviceName!,
                                style: TextStyle(
                                  color: serviceModel.status != "0"
                                      ? Colors.white
                                      : Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    //itemCount: widget.caseViewModel.caseModel.services!.length,
                  ),
                ),
              ),
            //Create Case Button
            OutlinedButtonComponent(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              title: 'Create Service',
              onPress: () =>
                  widget.caseViewModel.navigateToCreateCaseScreen(context),
            ),
            OutlinedButtonComponent(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: 'Home',
              onPress: () => widget.caseViewModel.navigateToHomeScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
