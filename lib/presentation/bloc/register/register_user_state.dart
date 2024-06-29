//register_user_state.dart
import 'package:equatable/equatable.dart';

abstract class RegisterUserState extends Equatable {
  const RegisterUserState();

  @override
  List<Object> get props => [];
}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserSuccess extends RegisterUserState {
  final String message;

  const RegisterUserSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterUserFailure extends RegisterUserState {
  final String error;

  const RegisterUserFailure({required this.error});

  @override
  List<Object> get props => [error];
}
