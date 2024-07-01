import 'package:sapdos_api_integration_assignment/data/models/doctor_dashboard_model.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

class GetDoctorDashboardUseCase {
  final ApiService apiService;

  GetDoctorDashboardUseCase({required this.apiService});

  Future<DoctorDashboardModel> call() async {
    final response = await apiService.getDoctorDashboard();
    return response;
  }
}
