import 'package:sapdos_api_integration_assignment/data/models/doctor_dashboard_model.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

// get_doctor_dashboard.dart
class GetDoctorDashboardUseCase {
  final ApiService apiService;

  GetDoctorDashboardUseCase({required this.apiService});

  Future<DoctorDashboardModel> call() async {
    //final response = await apiService.get('https://sapdos-api-v2.azurewebsites.net/api/Doctor/GetDoctorDashbord');
    final response = await apiService.get('https://sapdos-api-v2.azurewebsites.net/api/Doctor/GetDoctorDashbord?DoctorUId=doctor6576&Date=29%2F6%2F2024');
    print(response); // Check the response format
    return DoctorDashboardModel.fromJson(response);
  }
}
