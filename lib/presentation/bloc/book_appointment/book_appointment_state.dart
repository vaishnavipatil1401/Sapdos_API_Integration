import 'package:equatable/equatable.dart';

abstract class BookAppointmentState extends Equatable {
  const BookAppointmentState();

  @override
  List<Object> get props => [];
}

class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentSuccess extends BookAppointmentState {}

class BookAppointmentFailure extends BookAppointmentState {
  final String error;

  const BookAppointmentFailure({required this.error});

  @override
  List<Object> get props => [error];
}
