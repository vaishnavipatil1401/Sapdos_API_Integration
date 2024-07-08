import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_response_model.dart';
import 'package:sapdos_api_integration_assignment/domain/repositories/user_repository.dart';

class RegisterUseCase {
  final UserRepository userRepository;

  RegisterUseCase({required this.userRepository});

  Future<RegisterResponseModel> call(RegisterRequestModel requestModel) {
    return userRepository.register(requestModel);
  }
}
