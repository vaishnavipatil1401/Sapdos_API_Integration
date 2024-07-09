import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import '../bloc/doctor_dashboard/doctor_dashboard_event.dart';
import '../bloc/doctor_dashboard/doctor_dashboard_state.dart';
import '../widgets/sidebar.dart'; 

class DoctorDashboardScreen extends StatelessWidget {
  final String doctorId;
  final String date;

  DoctorDashboardScreen({required this.doctorId, required this.date});

  @override
  Widget build(BuildContext context) {
    final doctorDashboardBloc = BlocProvider.of<DoctorDashboardBloc>(context);
    doctorDashboardBloc.add(FetchDoctorDashboard(doctorId: doctorId, date: date));

    return Scaffold(
      appBar: AppBar(title: Text('Doctor Dashboard')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
          bool isLaptop = constraints.maxWidth >= 1024;

          return Row(
            children: [
              if (!isMobile) Sidebar(), // Show sidebar only on larger screens
              Expanded(
                child: BlocBuilder<DoctorDashboardBloc, DoctorDashboardState>(
                  builder: (context, state) {
                    if (state is DoctorDashboardLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is DoctorDashboardLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pending Appointments: ${state.doctorDashboard.pendingAppointment}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Completed Appointments: ${state.doctorDashboard.completedAppointment}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Total Appointments: ${state.doctorDashboard.totalAppointment}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.doctorDashboard.patientList.length,
                              itemBuilder: (context, index) {
                                final appointment = state.doctorDashboard.patientList[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                'https://png.pngtree.com/background/20230301/original/pngtree-thoughtful-female-doctor-close-up-portrait-of-a-beautiful-thoughtful-female-picture-image_2067704.jpg'), // Replace with actual image URL
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  appointment.name,
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Time: ${appointment.slotTime}',
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 12,
                                                      height: 12,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: appointment.treated ? Colors.green : Colors.red,
                                                      ),
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      appointment.treated ? 'Treated' : 'Pending',
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is DoctorDashboardFailure) {
                      return Center(child: Text('Failed to load data: ${state.error}'));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
