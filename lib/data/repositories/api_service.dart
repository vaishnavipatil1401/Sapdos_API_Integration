import 'package:dio/dio.dart';
import 'package:sapdos_api_integration_assignment/data/models/patient_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data) async {
    final response = await _dio.post(url, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> get(String url) async {
    final response = await _dio.get(url);
    return response.data;
  }

  Future<Patient> getPatientDetails(String patientId) async {
    final response = await get('https://api.example.com/patients/$patientId');
    return Patient.fromJson(response);
  }
}
