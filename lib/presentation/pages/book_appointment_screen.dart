import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/book_appointment.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_state.dart';

class BookAppointmentScreen extends StatelessWidget {
  final BookAppointmentUseCase bookAppointmentUseCase;

  BookAppointmentScreen({required this.bookAppointmentUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: BlocProvider<BookAppointmentBloc>(
        create: (context) => BookAppointmentBloc(bookAppointmentUseCase: bookAppointmentUseCase),
        child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
          builder: (context, state) {
            // Build UI based on state
            return Container();
          },
        ),
      ),
    );
  }
}
