import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_dashboard/doctor_dashboard_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_dashboard/doctor_dashboard_state.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/doctor_details_screen.dart';

class DoctorDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorDashboardBloc = BlocProvider.of<DoctorDashboardBloc>(context);
    doctorDashboardBloc.add(FetchDoctorDashboard());

    return Scaffold(
      appBar: AppBar(title: Text('Doctor Dashboard')),
      body: BlocBuilder<DoctorDashboardBloc, DoctorDashboardState>(
        builder: (context, state) {
          if (state is DoctorDashboardLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DoctorDashboardLoaded) {
            return ListView.builder(
              itemCount: state.doctorDashboard.appointments.length,
              itemBuilder: (context, index) {
                final appointment = state.doctorDashboard.appointments[index];
                return ListTile(
                  title: Text(appointment.patientName),
                  subtitle: Text(appointment.time),
                  trailing: Icon(
                    appointment.isCompleted ? Icons.check_circle : Icons.pending,
                    color: appointment.isCompleted ? Colors.green : Colors.red,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen(doctorId: appointment.patientId),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is DoctorDashboardFailure) {
            return Center(child: Text('Failed to load data: ${state.error}'));
          }
          return Container();
        },
      ),
    );
  }
}
