import 'package:equatable/equatable.dart';

abstract class DoctorDashboardEvent extends Equatable {
  const DoctorDashboardEvent();

  @override
  List<Object?> get props => [];
}

class FetchDoctorDashboard extends DoctorDashboardEvent {
  final String doctorId;
  final String date;

  FetchDoctorDashboard({required this.doctorId, required this.date});

  @override
  List<Object?> get props => [doctorId, date];
}
