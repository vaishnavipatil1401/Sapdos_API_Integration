part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}

class PatientLoaded extends PatientState {
  final Patient patient;

  const PatientLoaded({required this.patient});

  @override
  List<Object> get props => [patient];
}

class PatientFailure extends PatientState {
  final String error;

  const PatientFailure({required this.error});

  @override
  List<Object> get props => [error];
}
