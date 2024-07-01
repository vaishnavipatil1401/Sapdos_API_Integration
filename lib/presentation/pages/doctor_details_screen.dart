import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_model.dart';
import '../bloc/doctor_details/doctor_details_bloc.dart';
import '../bloc/doctor_details/doctor_details_event.dart';
import '../bloc/doctor_details/doctor_details_state.dart';
//import '../models/doctor.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorId;

  DoctorDetailsScreen({required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final doctorDetailsBloc = BlocProvider.of<DoctorDetailsBloc>(context);
    doctorDetailsBloc.add(FetchDoctorDetails(doctorId));

    return Scaffold(
      appBar: AppBar(title: Text('Doctor Details')),
      body: BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
        builder: (context, state) {
          if (state is DoctorDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DoctorDetailsLoaded) {
            final Doctor doctor = state.doctor;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Name: ${doctor.name}'),
                ),
                ListTile(
                  title: Text('Specialization: ${doctor.specialization}'),
                ),
                ListTile(
                  title: Text('Available Slots:'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: doctor.availableSlots
                        .map((slot) => Text(slot))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/book-appointment', arguments: doctor.id);
                  },
                  child: Text('Book Appointment'),
                ),
              ],
            );
          } else if (state is DoctorDetailsFailure) {
            return Center(child: Text('Failed to load doctor details: ${state.error}'));
          }

          return Container();
        },
      ),
    );
  }
}
