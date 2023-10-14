class ServiceModel {
  String? id;
  String? serviceName;
  String? party;
  String? typeOfService;
  String? notificationType;
  String? notes;
  String? status;

  ServiceModel({
    this.id,
    this.serviceName,
    this.party,
    this.typeOfService,
    this.notificationType,
    this.notes,
    this.status,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    party = json['party'];
    typeOfService = json['type_of_service'];
    notificationType = json['notification_type'];
    notes = json['notes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_name'] = serviceName;
    data['party'] = party;
    data['type_of_service'] = typeOfService;
    data['notification_type'] = notificationType;
    data['notes'] = notes;
    data['status'] = status;
    return data;
  }
}
