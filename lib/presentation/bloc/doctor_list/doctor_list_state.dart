import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

abstract class DoctorListState extends Equatable {
  const DoctorListState();

  @override
  List<Object> get props => [];
}

class DoctorListInitial extends DoctorListState {}

class DoctorListLoading extends DoctorListState {}

class DoctorListLoaded extends DoctorListState {
  final List<Doctor> doctors;

  const DoctorListLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

class DoctorListFailure extends DoctorListState {
  final String error;

  const DoctorListFailure({required this.error});

  @override
  List<Object> get props => [error];
}
