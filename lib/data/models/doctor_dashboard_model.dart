import 'appointment_model.dart';

class DoctorDashboardModel {
  final List<Appointment> appointments;

  DoctorDashboardModel({required this.appointments});

  factory DoctorDashboardModel.fromJson(Map<String, dynamic>? json) {
    if (json == null || json['appointments'] == null) {
      return DoctorDashboardModel(appointments: []);
    }

    var list = json['appointments'] as List;
    List<Appointment> appointmentsList =
        list.map((i) => Appointment.fromJson(i)).toList();

    return DoctorDashboardModel(
      appointments: appointmentsList,
    );
  }
}
