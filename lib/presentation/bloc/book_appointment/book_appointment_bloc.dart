import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/book_appointment.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/book_appointment.dart';
import 'book_appointment_event.dart';
import 'book_appointment_state.dart';

class BookAppointmentBloc extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  BookAppointmentBloc({required this.bookAppointmentUseCase}) : super(BookAppointmentInitial()) {
    on<SubmitAppointment>(_onSubmitAppointment);
  }

  void _onSubmitAppointment(SubmitAppointment event, Emitter<BookAppointmentState> emit) async {
    emit(BookAppointmentLoading());
    try {
      await bookAppointmentUseCase(event.appointment);
      emit(BookAppointmentSuccess());
    } catch (error) {
      emit(BookAppointmentFailure(error: error.toString()));
    }
  }
}
