// //lib/presentation/bloc/book_appointment/doctor_list_state.dart
// import 'package:equatable/equatable.dart';
// import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

// abstract class DoctorListState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class DoctorListInitial extends DoctorListState {}

// class DoctorListLoading extends DoctorListState {}

// class DoctorListLoaded extends DoctorListState {
//   final List<Doctor> doctors;

//   DoctorListLoaded({required this.doctors});

//   @override
//   List<Object> get props => [doctors];
// }

// class DoctorListFailure extends DoctorListState {
//   final String error;

//   DoctorListFailure({required this.error});

//   @override
//   List<Object> get props => [error];
// }
