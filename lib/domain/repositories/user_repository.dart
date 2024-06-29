import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_response_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_response_model.dart';

abstract class UserRepository {
  Future<LoginResponseModel> login(LoginRequestModel requestModel);
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel);
}
