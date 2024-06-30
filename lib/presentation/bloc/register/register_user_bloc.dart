import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';
import 'register_user_event.dart';
import 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUseCase registerUseCase;

  RegisterUserBloc({required this.registerUseCase}) : super(RegisterUserInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterUserLoading());
      try {
        final registerResponse = await registerUseCase(event.registerRequest);
        emit(RegisterUserSuccess(message: registerResponse.message));
      } catch (error) {
        emit(RegisterUserFailure(error: error.toString()));
      }
    });
  }
}
