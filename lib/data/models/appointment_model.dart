class Appointment {
  final String patientName;
  final String time;
  final bool isCompleted;
  final String patientId;

  Appointment({
    required this.patientName,
    required this.time,
    required this.isCompleted,
    required this.patientId,
  });

  factory Appointment.fromJson(Map<String, dynamic>? json) {
    return Appointment(
      patientName: json?['patientName'] ?? '',
      time: json?['time'] ?? '',
      isCompleted: json?['isCompleted'] ?? false,
      patientId: json?['patientId'] ?? '',
    );
  }
}
