import 'package:dio/dio.dart';
import 'package:sapdos_api_integration_assignment/data/models/patient_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      print('Error in post request: $e');
      throw Exception('Failed to perform POST request');
    }
  }

  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      print('Error in get request: $e');
      throw Exception('Failed to perform GET request');
    }
  }

  Future<Patient> getPatientDetails(String patientId) async {
    try {
      final response = await get('https://api.example.com/patients/$patientId');
      return Patient.fromJson(response);
    } catch (e) {
      print('Error while fetching patient details: $e');
      rethrow; // Rethrow the caught exception to propagate it further
    }
  }
}
