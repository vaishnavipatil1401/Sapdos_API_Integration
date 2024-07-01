import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

class BookAppointmentUseCase {
  final ApiService apiService;

  BookAppointmentUseCase({required this.apiService});

  Future<void> call(String doctorId) async {
    try {
      await apiService.post('https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment', {
        'DoctorUId': doctorId,
        
      });
    } catch (e) {
      throw Exception('Failed to book appointment: $e');
    }
  }
}
