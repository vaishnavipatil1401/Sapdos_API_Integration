//patient_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/api_service.dart';
import '../../../data/models/patient_model.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final ApiService apiService;

  PatientBloc({required this.apiService}) : super(PatientInitial());

  @override
  Stream<PatientState> mapEventToState(PatientEvent event) async* {
    if (event is FetchPatientDetails) {
      yield* _mapFetchPatientDetailsToState(event);
    }
  }

  Stream<PatientState> _mapFetchPatientDetailsToState(
      FetchPatientDetails event) async* {
    try {
      final patient = await apiService.getPatientDetails(event.patientId);
      yield PatientLoaded(patient: patient);
    } catch (error) {
      yield PatientFailure(error: error.toString());
    }
  }
}
