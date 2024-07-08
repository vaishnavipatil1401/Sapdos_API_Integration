import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_response_model.dart';
import 'package:sapdos_api_integration_assignment/domain/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  Future<LoginResponseModel> call(LoginRequestModel requestModel) {
    return userRepository.login(requestModel);
  }
}
