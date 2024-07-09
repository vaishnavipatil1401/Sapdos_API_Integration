import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

//import '../repositories/api_service.dart';
import '../../data/models/doctor_dashboard_model.dart';

class GetDoctorDashboardUseCase {
  final ApiService apiService;

  GetDoctorDashboardUseCase({required this.apiService});

  Future<DoctorDashboardModel> call(String doctorId, String date) async {
    final response = await apiService.getDoctorDashboard(doctorId, date);
    return response;
  }
}
