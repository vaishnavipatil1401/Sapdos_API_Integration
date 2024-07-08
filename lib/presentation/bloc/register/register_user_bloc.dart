import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUseCase registerUseCase;

  RegisterUserBloc({required this.registerUseCase}) : super(RegisterUserInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  void _onRegisterButtonPressed(RegisterButtonPressed event, Emitter<RegisterUserState> emit) async {
    emit(RegisterUserLoading());
    try {
      final response = await registerUseCase(event.registerRequest);
      print('Registration response: $response');
      emit(RegisterUserSuccess(message: response.message ?? 'Registration successful'));
    } catch (error) {
      print('Registration error: $error');
      emit(RegisterUserFailure(error: error.toString()));
    }
  }
}
