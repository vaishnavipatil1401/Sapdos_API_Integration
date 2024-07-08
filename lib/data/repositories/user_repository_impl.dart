import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_response_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_response_model.dart';
import 'package:sapdos_api_integration_assignment/domain/repositories/user_repository.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  UserRepositoryImpl({required this.apiService});

  @override
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
      final response = await apiService.post(
        'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login',
        requestModel.toJson(),
      );
      return LoginResponseModel.fromJson(response);
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    try {
      final response = await apiService.post(
        'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register',
        requestModel.toJson(),
      );
      return RegisterResponseModel.fromJson(response);
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }
}
