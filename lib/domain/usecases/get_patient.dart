import 'package:sapdos_api_integration_assignment/data/models/patient_model.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

class GetPatientUseCase {
  final ApiService apiService;

  GetPatientUseCase({required this.apiService});

  Future<Patient> call(String patientId) async {
    final response = await apiService.get(
      'https://sapdos-api-v2.azurewebsites.net/api/Patient/GetPatientByUId?PatientUId=$patientId'
    );
    return Patient.fromJson(response);
  }
}
