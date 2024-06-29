//user_repository_impl.dart
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
    final response = await apiService.post(
      'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login',
      requestModel.toJson(),
    );
    return LoginResponseModel.fromJson(response);
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    final response = await apiService.post(
      'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register',
      requestModel.toJson(),
    );
    return RegisterResponseModel.fromJson(response);
  }
}
