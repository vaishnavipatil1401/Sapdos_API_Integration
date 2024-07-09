// presentation/bloc/book_appointment/book_appointment_event.dart
import 'package:equatable/equatable.dart';

abstract class BookAppointmentEvent extends Equatable {
  const BookAppointmentEvent();

  @override
  List<Object> get props => [];
}

class BookAppointmentRequested extends BookAppointmentEvent {
  final Map<String, dynamic> appointmentDetails;

  const BookAppointmentRequested({required this.appointmentDetails});

  @override
  List<Object> get props => [appointmentDetails];
}
