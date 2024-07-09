//doctor_dashboard_state.dart
import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_dashboard_model.dart';

abstract class DoctorDashboardState extends Equatable {
  const DoctorDashboardState();

  @override
  List<Object?> get props => [];
}

class DoctorDashboardInitial extends DoctorDashboardState {}

class DoctorDashboardLoading extends DoctorDashboardState {}

class DoctorDashboardLoaded extends DoctorDashboardState {
  final DoctorDashboardModel doctorDashboard;

  const DoctorDashboardLoaded({required this.doctorDashboard});

  @override
  List<Object?> get props => [doctorDashboard];
}

class DoctorDashboardFailure extends DoctorDashboardState {
  final String error;

  const DoctorDashboardFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
