import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/book_appointment.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_state.dart';

class BookAppointmentBloc extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  BookAppointmentBloc({required this.bookAppointmentUseCase}) : super(BookAppointmentInitial()) {
    on<BookAppointmentEvent>(_onBookAppointmentEvent);
  }

  void _onBookAppointmentEvent(BookAppointmentEvent event, Emitter<BookAppointmentState> emit) async {
    emit(BookAppointmentLoading());
    try {
      final result = await bookAppointmentUseCase(event.appointmentDetails.toString());
      emit(BookAppointmentSuccess(result: result));
    } catch (error) {
      emit(BookAppointmentFailure(error: error.toString()));
    }
  }
}
