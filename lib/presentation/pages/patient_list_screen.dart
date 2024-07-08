// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/patient/patient_bloc.dart';
// import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
// import 'package:sapdos_api_integration_assignment/presentation/pages/patient_details_screen.dart';

// class PatientListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patients'),
//       ),
//       body: BlocProvider(
//         create: (context) => PatientBloc(apiService: ApiService())..add(FetchPatientDetails(patientId: 'sample_patient_id')),
//         child: BlocBuilder<PatientBloc, PatientState>(
//           builder: (context, state) {
//             if (state is PatientInitial) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is PatientLoaded) {
//               return ListView.builder(
//                 itemCount: 1, 
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(state.patient.name),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PatientDetailsScreen(patientId: state.patient.id),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             } else if (state is PatientFailure) {
//               return Center(child: Text('Failed to load patients: ${state.error}'));
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
