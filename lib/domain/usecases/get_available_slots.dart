import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_model.dart';

class GetAvailableSlotsUseCase {
  final ApiService apiService;

  GetAvailableSlotsUseCase({required this.apiService});

  Future<List<String>> call(String doctorId) async {
    final response = await apiService.getDoctorDetails(doctorId);
    return response.availableSlots;
  }
}
