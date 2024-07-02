import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_model.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

class GetDoctorDetailsUseCase {
  final ApiService apiService;

  GetDoctorDetailsUseCase({required this.apiService});

  Future<Doctor> call(String doctorId) async {
    final response = await apiService.getDoctorDetails(doctorId);
    return response;
  }
}
