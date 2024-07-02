// presentation/bloc/book_appointment/book_appointment_state.dart
import 'package:equatable/equatable.dart';

abstract class BookAppointmentState extends Equatable {
  const BookAppointmentState();

  @override
  List<Object> get props => [];
}

class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentSuccess extends BookAppointmentState {
  final Map<String, dynamic> result;

  const BookAppointmentSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class BookAppointmentFailure extends BookAppointmentState {
  final String error;

  const BookAppointmentFailure({required this.error});

  @override
  List<Object> get props => [error];
}
