import 'package:dio/dio.dart';
import 'package:sapdos_api_integration_assignment/data/models/doctor_dashboard_model.dart';

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

  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      print('Error in get request: ${e.response?.statusCode} ${e.response?.data}');
      throw Exception('Failed to perform GET request');
    }
  }

  Future<Map<String, dynamic>> getDoctorDetails(String doctorId) async {
    final response = await get('/Doctor/GetDoctorByUId?DoctorUId=$doctorId');
    return response;
  }

  Future<DoctorDashboardModel> getDoctorDashboard(String doctorId, String date) async {
    final response = await get('/Doctor/GetDoctorDashbord?DoctorUId=$doctorId&Date=$date');
    return DoctorDashboardModel.fromJson(response);
  }

  Future<List<Map<String, dynamic>>> getAllDoctors() async {
    final response = await get('/Doctor/GetAllDoctors');
    final List<dynamic> doctorListJson = response['data'] as List<dynamic>;
    return doctorListJson.map((json) => json as Map<String, dynamic>).toList();
  }
}
