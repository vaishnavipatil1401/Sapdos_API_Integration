// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/book_appointment/book_appointment_bloc.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_list/doctor_list_bloc.dart';
// import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_list/doctor_list_event.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_list/doctor_list_state.dart';
// import 'package:sapdos_api_integration_assignment/presentation/pages/doctor_details_screen.dart';

// class DoctorListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final doctorListBloc = BlocProvider.of<DoctorListBloc>(context);
//     doctorListBloc.add(FetchDoctorList());

//     return Scaffold(
//       appBar: AppBar(title: Text('Doctor List')),
//       body: BlocBuilder<DoctorListBloc, DoctorListState>(
//         builder: (context, state) {
//           if (state is DoctorListLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is DoctorListLoaded) {
//             return ListView.builder(
//               itemCount: state.doctors.length,
//               itemBuilder: (context, index) {
//                 final doctor = state.doctors[index];
//                 return ListTile(
//                   title: Text(doctor.name),
//                   subtitle: Text(doctor.specialization),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DoctorDetailsScreen(doctorId: doctor.id),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is DoctorListFailure) {
//             return Center(child: Text('Failed to load data: ${state.error}'));
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
