import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_model.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

class GetDoctorListUseCase {
  final ApiService apiService;

  GetDoctorListUseCase({required this.apiService});

  Future<List<Doctor>> execute() async {
    try {
      final List<Map<String, dynamic>> doctorListJson = await apiService.getAllDoctors();
      final List<DoctorModel> doctorModels = doctorListJson.map((json) => DoctorModel.fromJson(json)).toList();
      return doctorModels.map((doctorModel) => doctorModel.toDomain()).toList();
    } catch (e) {
      throw Exception('Failed to fetch doctor list');
    }
  }
}
