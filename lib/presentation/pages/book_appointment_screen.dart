import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_state.dart';

class BookAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: BlocProvider<BookAppointmentBloc>(
        create: (context) => BookAppointmentBloc(),
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
