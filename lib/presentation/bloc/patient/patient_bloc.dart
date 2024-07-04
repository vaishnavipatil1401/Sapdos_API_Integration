import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/api_service.dart';
import '../../../data/models/patient_model.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final ApiService apiService;

  PatientBloc({required this.apiService}) : super(PatientInitial()) {
    on<FetchPatientDetails>(_onFetchPatientDetails);
  }

  void _onFetchPatientDetails(FetchPatientDetails event, Emitter<PatientState> emit) async {
    try {
      final patient = await apiService.getPatientDetails(event.patientId);
      emit(PatientLoaded(patient: patient));
    } catch (error) {
      emit(PatientFailure(error: error.toString()));
    }
  }
}
