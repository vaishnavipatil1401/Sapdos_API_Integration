class Patient {
  final String patientId;
  final String issueDescription;
  final List<String> history;
  final List<String> prescription;

  Patient({
    required this.patientId,
    required this.issueDescription,
    required this.history,
    required this.prescription,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patientId'],
      issueDescription: json['issueDescription'],
      history: List<String>.from(json['history']),
      prescription: List<String>.from(json['prescription']),
    );
  }
}
