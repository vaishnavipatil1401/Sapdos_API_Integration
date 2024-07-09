class Appointment {
  final String slotUId;
  final String patientUId;
  final String name;
  final String slotTime;
  final bool treated;

  Appointment({
    required this.slotUId,
    required this.patientUId,
    required this.name,
    required this.slotTime,
    required this.treated,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      slotUId: json['slotUId'] ?? '',
      patientUId: json['patientUId'] ?? '',
      name: json['name'] ?? '',
      slotTime: json['slotTime'] ?? '',
      treated: json['treated'] ?? false,
    );
  }
}
