import 'appointment_model.dart';

class DoctorDashboardModel {
  final int pendingAppointment;
  final int completedAppointment;
  final int totalAppointment;
  final List<Appointment> patientList;

  DoctorDashboardModel({
    required this.pendingAppointment,
    required this.completedAppointment,
    required this.totalAppointment,
    required this.patientList,
  });

  factory DoctorDashboardModel.fromJson(Map<String, dynamic> json) {
    var list = json['patientList'] as List;
    List<Appointment> patientList = list.map((i) => Appointment.fromJson(i)).toList();

    return DoctorDashboardModel(
      pendingAppointment: json['pendingAppointment'] ?? 0,
      completedAppointment: json['completedAppointment'] ?? 0,
      totalAppointment: json['totalAppointment'] ?? 0,
      patientList: patientList,
    );
  }
}
