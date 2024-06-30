import 'package:equatable/equatable.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';

abstract class RegisterUserEvent extends Equatable {
  const RegisterUserEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterUserEvent {
  final RegisterRequestModel registerRequest;

  const RegisterButtonPressed({required this.registerRequest});

  @override
  List<Object> get props => [registerRequest];
}
