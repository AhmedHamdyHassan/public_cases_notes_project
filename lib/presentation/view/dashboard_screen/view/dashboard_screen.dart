import 'package:case_app/models/case_model.dart';
import 'package:case_app/presentation/components/outlined_button_component.dart';
import 'package:case_app/presentation/components/text_field_component.dart';
import 'package:case_app/presentation/view/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:case_app/repository/cases_repository.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.dashboardViewModel,
  });
  final DashboardViewModel dashboardViewModel;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldComponent(
              prefixIcon: const Icon(Icons.search),
              hint: 'Search Case',
              padding: const EdgeInsets.all(20),
              onChanged: (value) {
                setState(() {
                  widget.dashboardViewModel.filterKey = value;
                });
              },
            ),
            //List of Cases
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FirebaseAnimatedList(
                  query: casesRipository.query,
                  itemBuilder: (context, snapshot, animation, index) {
                    final CaseModel caseModel = casesRipository.getCase(
                        snapshot.value as Map, snapshot.key!);
                    caseModel.id = snapshot.key;
                    return caseModel.caseName!
                            .contains(widget.dashboardViewModel.filterKey)
                        ? GestureDetector(
                            onTap: () => widget.dashboardViewModel
                                .navigateToCaseScreen(context, caseModel),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 10,
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        caseModel.caseName!,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () => widget
                                            .dashboardViewModel
                                            .navigateToEditScreen(
                                                context, caseModel),
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => widget
                                            .dashboardViewModel
                                            .removeCase(caseModel),
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container();
                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            //Create Case Button
            OutlinedButtonComponent(
              title: 'Create Case',
              padding: const EdgeInsets.all(20),
              onPress: () =>
                  widget.dashboardViewModel.navigateToCreateCaseScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
