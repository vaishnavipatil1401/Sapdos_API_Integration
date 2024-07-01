import 'package:sapdos_api_integration_assignment/data/models/doctor_model.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

class GetDoctorListUseCase {
  final ApiService apiService;

  GetDoctorListUseCase({required this.apiService});

  Future<List<Doctor>> call() async {
    final response = await apiService.getDoctorList();
    return response;
  }
}
