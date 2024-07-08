// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sapdos_api_integration_assignment/presentation/bloc/patient/patient_bloc.dart';
// import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

// class PatientDetailsScreen extends StatelessWidget {
//   final String patientId;

//   PatientDetailsScreen({required this.patientId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Patient Details')),
//       body: BlocProvider(
//         create: (context) => PatientBloc(apiService: ApiService())..add(FetchPatientDetails(patientId: patientId)),
//         child: BlocBuilder<PatientBloc, PatientState>(
//           builder: (context, state) {
//             if (state is PatientInitial) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is PatientLoaded) {
//               return ListView(
//                 children: [
//                   ExpansionPanelList(
//                     expansionCallback: (index, isExpanded) {
                      
//                     },
//                     children: [
//                       ExpansionPanel(
//                         headerBuilder: (context, isExpanded) {
//                           return ListTile(
//                             title: Text('Patient History'),
//                           );
//                         },
//                         body: ListTile(
//                           title: Text(state.patient.details),
//                         ),
//                         isExpanded: state.patient.isExpanded,
//                       ),
//                     ],
//                   ),
//                   ListTile(
//                     title: Text('Patient Name: ${state.patient.name}'),
//                     subtitle: Text('Details: ${state.patient.details}'),
//                   ),
//                 ],
//               );
//             } else if (state is PatientFailure) {
//               return Center(child: Text('Failed to load data'));
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
