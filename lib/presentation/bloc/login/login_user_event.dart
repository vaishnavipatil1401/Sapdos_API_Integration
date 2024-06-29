import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';

abstract class LoginUserEvent extends Equatable {
  const LoginUserEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginUserEvent {
  final LoginRequestModel loginRequest;

  const LoginButtonPressed({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}
