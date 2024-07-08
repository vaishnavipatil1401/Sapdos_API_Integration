import 'package:dio/dio.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';
import '../models/doctor_dashboard_model.dart';
import '../models/doctor_model.dart';
import '../models/patient-model.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://sapdos-api-v2.azurewebsites.net/api',
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      print('Error in post request: ${e.response?.statusCode} ${e.response?.data}');
      throw Exception('Failed to perform POST request');
    }
  }

  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      print('Error in get request: ${e.response?.statusCode} ${e.response?.data}');
      throw Exception('Failed to perform GET request');
    }
  }

  Future<DoctorDashboardModel> getDoctorDashboard() async {
    final response = await get('/Doctor/GetDoctorDashbord');
    return DoctorDashboardModel.fromJson(response);
  }

  Future<Patient> getPatientDetails(String patientId) async {
    final response = await get('/Patient/GetPatientByUId?PatientUId=$patientId');
    return Patient.fromJson(response);
  }

  Future<Doctor> getDoctorDetails(String doctorId) async {
    final response = await get('/Doctor/GetDoctorByUId?DoctorUId=$doctorId');
    return Doctor.fromJson(response);
  }

  Future<List<Doctor>> getDoctorList() async {
    final response = await get('/Doctor/GetDoctorList');
    final doctors = (response['data'] as List).map((e) => Doctor.fromJson(e)).toList();
    return doctors;
  }
}
