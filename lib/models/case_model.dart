import 'package:case_app/models/service_model.dart';

class CaseModel {
  String? id;
  String? caseName;
  String? childName;
  String? sacwisId;
  String? typeOfCase;
  List<ServiceModel>? services;

  CaseModel({
    this.id,
    this.caseName,
    this.childName,
    this.sacwisId,
    this.typeOfCase,
    this.services,
  });

  CaseModel.fromJson(Map<String, dynamic> json) {
    caseName = json['case_name'];
    childName = json['child_name'];
    sacwisId = json['sacwis_id'];
    typeOfCase = json['type_of_case'];
    if (json['services'] != null) {
      services = <ServiceModel>[];
      json['services'].forEach((v) {
        services!.add(
          ServiceModel.fromJson(
            (v as Map).cast<String, dynamic>(),
          ),
        );
      });
    } else {
      services = <ServiceModel>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_name'] = caseName;
    data['child_name'] = childName;
    data['sacwis_id'] = sacwisId;
    data['type_of_case'] = typeOfCase;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
