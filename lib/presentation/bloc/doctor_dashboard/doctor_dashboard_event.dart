import 'package:equatable/equatable.dart';

abstract class DoctorDashboardEvent extends Equatable {
  const DoctorDashboardEvent();

  @override
  List<Object> get props => [];
}

class FetchDoctorDashboard extends DoctorDashboardEvent {}
