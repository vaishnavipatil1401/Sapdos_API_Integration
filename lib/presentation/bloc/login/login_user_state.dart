import 'package:equatable/equatable.dart';

abstract class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  final String token;

  const LoginUserSuccess({required this.token});

  @override
  List<Object> get props => [token];
}

class LoginUserFailure extends LoginUserState {
  final String error;

  const LoginUserFailure({required this.error});

  @override
  List<Object> get props => [error];
}
