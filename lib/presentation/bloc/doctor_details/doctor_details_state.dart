import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

abstract class DoctorDetailsState extends Equatable {
  const DoctorDetailsState();

  @override
  List<Object> get props => [];
}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final Doctor doctor;

  const DoctorDetailsLoaded({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

class DoctorDetailsFailure extends DoctorDetailsState {
  final String error;

  const DoctorDetailsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
