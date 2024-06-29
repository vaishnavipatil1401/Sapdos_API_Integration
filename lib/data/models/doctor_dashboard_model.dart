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

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      patientName: json['patientName'],
      time: json['time'],
      isCompleted: json['isCompleted'],
      patientId: json['patientId'],
    );
  }
}

class DoctorDashboardModel {
  final List<Appointment> appointments;

  DoctorDashboardModel({required this.appointments});

  factory DoctorDashboardModel.fromJson(Map<String, dynamic> json) {
    var list = json['appointments'] as List;
    List<Appointment> appointmentsList =
        list.map((i) => Appointment.fromJson(i)).toList();

    return DoctorDashboardModel(
      appointments: appointmentsList,
    );
  }
}
