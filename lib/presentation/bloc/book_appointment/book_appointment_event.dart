import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/appointment.dart';

abstract class BookAppointmentEvent extends Equatable {
  const BookAppointmentEvent();

  @override
  List<Object> get props => [];
}

class SubmitAppointment extends BookAppointmentEvent {
  final Appointment appointment;

  SubmitAppointment({required this.appointment});

  @override
  List<Object> get props => [appointment];
}
